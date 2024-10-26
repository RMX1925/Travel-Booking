//
//  FlightCard 2.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

struct FlightCard2: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Image("qatar_airways_logo") // replace with actual image asset name
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("QR-1023")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Spacer()
                Text("Economy | 1H 15M")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
            Divider()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Dubai (DXB)")
                        .font(.headline)
                    Text("17 Nov 2024 13:25")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("Dubai International Airport")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Doha (DOH)")
                        .font(.headline)
                    Text("17 Nov 2024 13:40")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("Doha Airport")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            Text("Layover Duration (DOH) 0h 50m")
                .font(.caption)
                .foregroundColor(.blue)
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.9))
                .cornerRadius(8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
        .padding(.horizontal)
    }
}
