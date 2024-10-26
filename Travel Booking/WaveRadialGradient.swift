//
//  WaveRadialGradient.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//


import SwiftUI

struct WaveRadialGradient: View {
    var body: some View {
        ZStack {
            // Background shape with a radial gradient
            RadialGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                           center: .center,
                           startRadius: 0,
                           endRadius: 300)
                .frame(width: 400, height: 400)
            
            // Wave shape
            WaveShape()
                .fill(RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.blue]),
                                     center: .center,
                                     startRadius: 0,
                                     endRadius: 150))
                .frame(width: 400, height: 400)
        }
    }
}

// Wave shape definition
struct WaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let waveHeight: CGFloat = 20
        let waveLength: CGFloat = 100
        
        path.move(to: CGPoint(x: 0, y: rect.midY))
        
        // Create wave
        for x in stride(from: 0, through: rect.width, by: 5) {
            let y = rect.midY + waveHeight * sin((x / waveLength) * (2 * .pi))
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}
