//
//  SplashView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image("splash_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .offset(x: -150)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.2),
                    Color.black.opacity(0),
                    
                ]),
                startPoint: .bottom,
                endPoint: .center
            )
            .edgesIgnoringSafeArea(.all)
                
            VStack(alignment: .center) {
                fullLogoText()
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Take a")
                        .font(.title2)
                    Text("Trip")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    Text("Create memories...")
                        .font(.system(size: 35))
                        .fontWeight(.medium)
                }
                .foregroundColor(.white)
                .padding(.bottom, 40)
            }
            .safeAreaPadding([.top, .bottom])
        }
    }

    func greetingText() -> some View {
        Text("Hello, World!")
    }
}

#Preview {
    SplashView()
}

