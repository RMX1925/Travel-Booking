//
//  LoginView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct LoginView: View {
    @StateObject private var authVM = AuthViewModel()
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    @State private var isPasswordVisible = false
    @State private var selection: Int?
    
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                
                fullLogoText(color: .appPrimary)
                

                VStack(alignment: .leading, spacing: 8) {
                    Text("Sign in to your")
                        .font(.title)
                        .bold()
                    Text("Account")
                        .font(.title)
                        .bold()
                    Text("Enter your email and password to log in")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                
                // Login Form
                VStack(spacing: 16) {
                    // Email Field
                    TextField("Ematourism@gmail.com", text: $email)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    
                    // Password Field
                    HStack {
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .font(.body)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Remember me and Forgot Password
                    HStack {
                        
                        Toggle("Remember me", isOn: $rememberMe)
                            .font(.callout)
                            .toggleStyle(CheckboxToggleStyle())
                        
                        Spacer()
                        
                        Button("Forgot Password ?") {
                            // Handle forgot password
                        }
                        .font(.callout)
                        .foregroundColor(Color(.appPrimary))
                    }
                    
                    // Login Button
                    NavigationLink(destination: HomeView().environmentObject(AuthViewModel()), tag: 1, selection: $selection) {
                        PrimaryButton(text: "Log in", action: {
                            self.selection = 1
                        })
                            .padding([.top, .bottom])
                    }
                    
                    
                    // Or divider
                    HStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 1)
                        Text("Or")
                            .foregroundColor(.gray)
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 1)
                    }
                    
                    // Social Login Buttons
                    VStack(spacing: 12) {
                        
                        OutlineButton(text: "Continue with Google", action: {})
                        OutlineButton(text: "Continue with Facebook", action: {})
                        
                    }
                }
                
                Spacer()
                
                // Sign Up Link
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    Button("Sign Up") {
                        // Handle sign up navigation
                    }
                    .font(.footnote)
                    .foregroundColor(.appPrimary)
                }
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 24)
            
        }
        
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
        let b = Double(rgbValue & 0xff) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}


#Preview {
    LoginView()
}
