//
//  BookingConfirmation.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

struct ConfirmBooking : View {
    
    let persons: [Person] = [
        Person(name: "Dinakar", type: "Adult"),
        Person(name: "Satya", type: "Adult"),
        Person(name: "Kumar", type: "Adult"),
        Person(name: "Harish", type: "Adult"),
    ]
    
    struct Person: Identifiable {
        let id = UUID()
        let name: String
        let type: String
    }
    
    var body: some View {
        NavigationView {
            FlightPageView(heading: "Booking Confirmation") {
                VStack(alignment: .leading) {
                    VStack(alignment: .center) {
                        HStack(alignment: .center) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                            
                                .controlSize(.large)
                            Text("Booking Confirmation Receipt")
                        }
                        
                        Text("Thanks for booking with us")
                            .font(.caption)
                        
                        HStack {
                            Text("Booking id: ")
                                .font(.caption)
                            
                            Text("XIDKJAEHE8")
                                .font(.caption)
                                .bold()
                        }
                        
                        HStack {
                            Text("GDS Reference ")
                                .font(.caption)
                            
                            Text("XIDKJAEHE8")
                                .font(.caption)
                                .bold()
                        }
                        
                    }
                    
                    .padding()

                    
                    
                    Text("Dubai - Kuwait")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    FlightCard()
                    
                    Text("Passenger(s) Details")
                        .padding([.top, .horizontal])
                        
                    
                    Table(persons) {
                        TableColumn("Name", value: \.name)
                        TableColumn("Type", value: \.type)
                    }
                    .frame(width: 340,height: 200)
                    
                    Button(action: {}) {
                        Text("View Voucher")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.orange)
                            .cornerRadius(22)
                    }
                    .padding(.top, 10)
                    .padding(.horizontal)
                }
                .padding([.top])
                .background(.white)
            }
            
            .toolbar(.hidden, for: .automatic)
        }
    }
}

#Preview {
    ConfirmBooking()
}
