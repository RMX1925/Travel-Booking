//
//  LocationCard.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct LocationCard: View {
    let type: String
    let city: String
    let code: String
    var isReversed: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "airplane")
                .foregroundColor(.black)
                .flipsForRightToLeftLayoutDirection(isReversed)
            VStack(alignment: .leading, spacing: 4) {
                Text(type)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(city)
                    .font(.subheadline)
                
            }
            Spacer()
            Text(code)
                .font(.title2)
                .fontWeight(.bold)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2)
        .padding(.horizontal)
    }
}
