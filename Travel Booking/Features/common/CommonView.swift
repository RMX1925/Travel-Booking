//
//  CommonView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

func fullLogoText(color : Color = .white) -> some View {
    HStack(spacing: 12) {
        Image("logo")
        
        Text("Travel Bookings")
            .font(.title)
            .foregroundColor(color)
            .bold()
    }
    .padding(.top, 60)
    
}

func PrimaryButton(text: String, action: @escaping () -> Void, cornerRadius: CGFloat = 12) -> some View {
    Button(action: action) {
        Text(text)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.appPrimary))
            .cornerRadius(cornerRadius)
    }
    
}

func OutlineButton(text: String, action: @escaping () -> Void, cornerRadius: CGFloat = 12) -> some View {
    Button(action: action) {
        HStack {
            Image("facebook_icon") // Add this to assets
                .resizable()
                .frame(width: 24, height: 24)
            Text(text)
    
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .foregroundStyle(.black)
        .bold()
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        //                            .shadow(color: .gray.opacity(0.1), radius: 2)
    }
}

func HomeViewHeaderBackground() -> some View {
    Image("splash_background")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: .infinity, height: 320)
        .overlay(
            LinearGradient(
                colors: [Color.blue.opacity(0.7), Color.blue.opacity(0.5)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipped()
}


func CircleButton(icon: String, action : @escaping () -> Void) -> some View {
    Circle()
        .fill(.white.opacity(0.2))
        .frame(width: 40, height: 40)
        .overlay(
            Image(systemName: icon)
                .foregroundColor(.white)
        )
        .onTapGesture {
            action()
        }
}
