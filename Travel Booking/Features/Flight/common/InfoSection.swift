//
//  InfoSection.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct InfoSection<Content: View>: View {
    let title: String
    @Binding var isExpanded: Bool
    let content: () -> Content
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(title)
                        .font(.headline)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            if isExpanded {
                content()
                    .padding(.top, 10)
            }
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
        .foregroundColor(.primary)
        .padding(.horizontal)
    }
}
