//
//  ProfileView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authVM: AuthViewModel
    
    // Menu Items Data
    struct MenuItem: Identifiable {
        let id = UUID()
        let icon: String
        let title: String
        let iconColor: Color
    }
    
    let menuItems = [
        MenuItem(icon: "flight_profile", title: "Flight", iconColor: .blue),
        MenuItem(icon: "hotel_profile", title: "Hotel", iconColor: .blue),
        MenuItem(icon: "package_profile", title: "Packages", iconColor: .blue)
    ]
    
    var body: some View {
            VStack(spacing: 0) {
                // Profile Header
                VStack(spacing: 16) {
                    Text("My Profile")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 60)
                    
                    HStack(spacing: 20) {
                        // Profile Image
                        Image(authVM.currentUser?.profileImage ?? "profile_image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        // User Info
                        VStack(alignment: .leading, spacing: 8) {
                            Text(authVM.currentUser?.name ?? "Dinakar")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(verbatim: "Dinakar@gmail.com")
                            
                            
                            Text("+1 654 785 4462")
                                .font(.subheadline)
                            
                        }
                        .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 20)
                .background(
                    Image("splash_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .infinity, height: 320)
                        .overlay(
                            LinearGradient(
                                colors: [Color.orange, Color.orange.opacity(0.8)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipped()
                    
                )
                
                // Menu Items
                VStack(spacing: 0) {
                    ForEach(menuItems) { item in
                        Button(action: {
                            // Handle menu item tap
                        }) {
                            HStack(spacing: 16) {
                                Image(item.icon)
                                    .font(.title3)
                                    .foregroundColor(item.iconColor)
                                    .frame(width: 24)
                                
                                Text(item.title)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 16)
                            .padding(.horizontal, 20)
                        }
                        
                        Divider()
                            .padding(.leading, 60)
                    }
                }
                .background(Color.white)
                
                Spacer()
                
                // Logout Button
                Button(action: {
                    authVM.logout()
                }) {
                    HStack(spacing: 12) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.blue)
                        
                        Text("Log Out")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Divider()
            }
            .toolbar(.hidden, for: .automatic)
        .edgesIgnoringSafeArea(.top)
    }
}

// Preview
#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
