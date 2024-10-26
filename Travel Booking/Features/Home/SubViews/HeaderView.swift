//
//  HeaderView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            // Profile Section
            HStack(spacing: 12) {
                Image("profile_image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("Hi, Dinakar")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            // Right Icons
            HStack(spacing: 16) {
                CircleButton(icon: "globe", action: {
                    
                })
                
                Circle()
                    .fill(.white.opacity(0.2))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text("KWI")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    )
            }
        }
    }
}


