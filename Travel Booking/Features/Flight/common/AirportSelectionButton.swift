//
//  AirportSelectionButton.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct AirportSelectionButton: View {
    let title: String
    let airport: Airport?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                if let airport = airport {
                    HStack {
                        Text(airport.city)
                            .font(.headline)
                        Text(airport.code)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                } else {
                    Text("Select \(title.lowercased())")
                        .font(.headline)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
    }
}
