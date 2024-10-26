//
//  BookingDetailsView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//


import SwiftUI

struct BookingDetailsView: View {
    @State private var isLoggedIn = false
    @State private var isMale = true
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var dateOfBirth = Date()
    @State private var passportNumber = ""
    @State private var issuingCountry = "Kuwait"
    @State private var dateOfExpiry = Date()
    @State private var agreedToTerms = false
    
    @State private var selection : Int?

    var body: some View {
        
        NavigationView {
            FlightPageView(heading: "Booking Details") {
                VStack(spacing: 0) {
                    // Header
                    VStack(spacing: 10) {

                        FlightCard2()
                        
                        Button(action: { isLoggedIn.toggle() }) {
                            HStack {
                                Text("Lorem Ipsum is simply dummy text of the printing")
                                    .foregroundColor(.white)
                                    .font(.caption)
                                Spacer()
                                Text("Log in")
                                    .foregroundColor(.orange)
                                    .padding(.horizontal)
                                    .background(Capsule().fill(Color.white.opacity(0.2)))
                            }
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                    .padding([.top, .bottom])
                    
                    // Passenger Information Form
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Enter Passenger Information")
                            .font(.headline)
                            .padding(.top)
                        
                        // Gender Selector
                        HStack {
                            GenderButton(title: "Male", isSelected: isMale) {
                                isMale = true
                            }
                            GenderButton(title: "Female", isSelected: !isMale) {
                                isMale = false
                            }
                        }
                        
                        // Text Fields for Passenger Information
                        FormTextField(placeholder: "First Name", text: $firstName)
                        FormTextField(placeholder: "Last Name", text: $lastName)
                        
                        DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                            .datePickerStyle(.compact)
                        
                        FormTextField(placeholder: "Passport Number", text: $passportNumber)
                        
                        // Issuing Country Selector
                        HStack {
                            Text("Issuing Country*")
                            Spacer()
                            Text("🇰🇼 \(issuingCountry)")
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        
                        DatePicker("Date of Expiry", selection: $dateOfExpiry, displayedComponents: .date)
                            .datePickerStyle(.compact)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // Fare Summary Section
                    VStack(spacing: 0) {
                        Text("Fare Summary")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color(hex: "00AEEF"))
                            .foregroundColor(.white)
                        
                        VStack(spacing: 10) {
                            fareSummaryRow(title: "Traveller x1 Adult", amount: "KWD 150.00")
                            Divider()
                            fareSummaryRow(title: "Fare", amount: "KWD 20.00")
                            Divider()
                            fareSummaryRow(title: "Taxes and fees", amount: "KWD 15.00")
                            Divider()
                            fareSummaryRow(title: "Sub Total", amount: "KWD 180.00")
                            Divider()
                            fareSummaryRow(title: "Total amount", amount: "KWD 180.00")
                        }
                        .padding(.horizontal)
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // Terms & Conditions and Continue Button
                    VStack {
                        Toggle(isOn: $agreedToTerms) {
                            Text("Lorem ipsum dolor sit amet consectetur. Arcu imperdiet nulla molestie")
                                .font(.footnote)
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        NavigationLink(destination: ConfirmBooking(), tag: 1, selection: $selection) {
                            Button(action: {
                                self.selection = 1
                            }) {
                                Text("Continue To Payment")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 44)
                                    .background(Color.orange)
                                    .cornerRadius(22)
                            }
                            .padding(.top, 10)
                        }
                        
                    }
                    .padding(.horizontal)
                }
                .background(Color(hex: "F8F9FA"))
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        
    }
    
    // Helper for creating fare summary rows
    func fareSummaryRow(title: String, amount: String) -> some View {
        HStack {
            Text(title)
                .font(.subheadline)
            Spacer()
            Text(amount)
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .padding(.vertical, 6)
    }
}

// Reusable UI components

// Gender button
struct GenderButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "circle.fill" : "circle")
                    .foregroundColor(.orange)
                Text(title)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
        }
    }
}

// Form text field
struct FormTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 1)
    }
}

// Flight card preview
//struct FlightCard: View {
//    var body: some View {
//        VStack(spacing: 8) {
//            HStack {
//                Image("qatar_logo")
//                Text("19:25 DXB")
//                Spacer()
//                Image(systemName: "airplane")
//                Spacer()
//                Text("20:10 KWI")
//            }
//            HStack {
//                Text("1 Stop")
//                Spacer()
//                Text("17hrs 15mins")
//            }
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(12)
//        .padding(.horizontal)
//    }
//}

// Preview
#Preview {
    BookingDetailsView()
}
