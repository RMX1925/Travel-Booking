//
//  ContentView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = false
    var body: some View {
        NavigationStack {
            ZStack {
                // Previous splash screen content
                if isActive {
                    LoginView()
                } else {
                    SplashView()
                }
            }
            .onAppear {
                // Automatic transition after 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
            .toolbar(.hidden, for: .automatic)
        }
    }
}

#Preview {
    ContentView()
}
