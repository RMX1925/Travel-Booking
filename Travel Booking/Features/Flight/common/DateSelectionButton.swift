//
//  DateSelectionButton.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct DateSelectionButton: View {
    let date: Date
    let action: () -> Void
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Select Date")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.blue)
                    Text(dateFormatter.string(from: date))
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
