//
//  DestinationDealCard.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

struct DestinationDealCard: View {
    let imageName: String
    let cityName: String
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 160, height: 160)
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            }
            
            Text(cityName)
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
}

