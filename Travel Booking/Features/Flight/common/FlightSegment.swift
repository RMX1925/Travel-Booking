//
//  FlightSegment.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct FlightSegment: View {
    let flight : Flight
    
    var body: some View {
        VStack(spacing: 16) {
            // Airline info
            HStack {
                Text(flight.airline)
                    .font(.headline)
                Text(flight.flightNumber)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text("Economy")
                    .font(.subheadline)
                Text(flight.duration)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack(alignment: .top) {
                // Departure info
                VStack(alignment: .leading, spacing: 4) {
                    Text(flight.departure)
                        .font(.headline)
                    Text(flight.departureTime)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(flight.departureTerminal)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Arrival info
                VStack(alignment: .trailing, spacing: 4) {
                    Text(flight.arrival)
                        .font(.headline)
                    Text(flight.arrivalTime)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(flight.arrivalTerminal)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
}
