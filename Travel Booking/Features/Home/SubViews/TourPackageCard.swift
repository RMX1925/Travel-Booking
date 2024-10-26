//
//  TourPackageCard.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI


// Tour Package Card
struct TourPackageCard: View {
    let imageName: String
    let destination: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text(destination)
                .font(.title3)
                .fontWeight(.semibold)
        }
        .frame(width: UIScreen.main.bounds.width * 0.5)
        .padding(.horizontal, 10)
        .background(Color.black.opacity(0.1))
        .cornerRadius(20)
    }
}
