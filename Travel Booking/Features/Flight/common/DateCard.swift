//
//  DateCard.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct DateCard: View {
    let title: String
    let date: Date?
    let formatter: DateFormatter
    var isReturnDate: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .foregroundColor(isReturnDate ? .orange : .gray)
                .font(.subheadline)
            
            if let date = date {
                Text(formatter.string(from: date))
                    .font(.headline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}
