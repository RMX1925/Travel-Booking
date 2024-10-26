//
//  HotelCard.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//


import SwiftUI

struct HotelCard: View {
    let imageName: String = "hotel_1"
    let hotelName: String = "Hilton Dubai Al Harbor"
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 140)
                .cornerRadius(16)
                .overlay {
                    LinearGradient(colors: [
                        Color.black.opacity(0),
                        Color.black.opacity(0.3)
                        
                    ], startPoint: .top, endPoint: .bottom)
                    .cornerRadius(16)
                    .overlay(alignment: .bottomLeading) {
                        Text(hotelName)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding()
                    }
                    
                    
                }
            
        }
    }
}




// Main Content View
struct HomeContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // Features Section
                
                
                // Tour Packages Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Tour Packages")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    
                }
            }
            .padding(.vertical, 24)
        }
    }
}

// Preview
struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
