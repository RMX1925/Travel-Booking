//
//  TripTypeButton.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct TripTypeButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(isSelected ? .white : .black)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(
                    isSelected ?
                    Color(hex: "87CEEB") :
                        Color.white
                )
                .cornerRadius(25)
                .shadow(color: .black.opacity(0.05), radius: 2)
            
            
        }
    }
}
