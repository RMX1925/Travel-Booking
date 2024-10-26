//
//  FlightPageView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

struct FlightPageView<Content: View>: View {
    var heading : String = "Flights"
    let content: () -> Content
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background gradient
            HomeViewHeaderBackground()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Custom Navigation Bar
                HStack {
                    CircleButton(icon: "chevron.left", action: {
                        dismiss()
                    })
                    Spacer()
                    Text(heading)
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.trailing, 40)
                    Spacer()
                }
                .padding()
                
                // Main Content
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        content()
                    }
                }
                .cornerRadius(30)
            }
        }
    }
}
