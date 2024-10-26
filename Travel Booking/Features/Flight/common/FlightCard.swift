//
//  FlightCard.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI
    
    struct FlightCard: View {
        var flights : [Flight] = [
            Flight(airline: "QATAR",
                   flightNumber: "QR-1023",
                   departure: "Dubai (DXB)",
                   departureTime: "17 Nov 2024 13:25",
                   departureTerminal: "Terminal: 1",
                   arrival: "Doha (DOH)",
                   arrivalTime: "17 Nov 2024 13:40",
                   arrivalTerminal: "Terminal: TBC",
                   duration: "1H 15M"
            ),
            
            Flight(
                airline: "QATAR",
                flightNumber: "QR-1023",
                departure: "Doha (DOH)",
                departureTime: "17 Nov 2024 13:40",
                departureTerminal: "Terminal: TBC",
                arrival: "Dubai (DXB)",
                arrivalTime: "17 Nov 2024 13:25",
                arrivalTerminal: "Terminal: 1",
                duration: "1H 15M"
            )
            
        ]
        
        var body: some View {
            VStack(spacing: 0) {
                // First flight
                FlightSegment(
                    
                    flight: flights[0]
                )
                
                // Layover info
                Text("Layover Duration (DOH) 0h 50m")
                    .font(.subheadline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .systemGray6))
                
                // Return flight
                FlightSegment(
                    flight: flights[1]
                )
            }
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.1), radius: 5)
        }
        
        private func formatTime(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: date)
        }
        
        private func formatDate(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            return formatter.string(from: date)
        }
    }
    
    
