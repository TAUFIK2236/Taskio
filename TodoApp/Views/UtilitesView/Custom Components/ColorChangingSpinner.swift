//
//  ColorChangingSpinner.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/10/25.
//


import SwiftUI

struct ColorChangingSpinner: View {
    @State private var rotation: Double = 0
    @State private var hue: Double = 0

    var body: some View {
        Circle()
            //.trim(from: 0, to: 1)
            
            .stroke(
                Color(hue: hue, saturation: 0.8, brightness: 0.7),
                style: StrokeStyle(lineWidth: 8, lineCap: .round,dash:[35,30,33,30])
            )
            .frame(width: 60, height: 60)
            .rotationEffect(.degrees(rotation))
            .shadow(color: Color.black.opacity(0.3), radius: 6, x: 2, y: 4) 
            .onAppear {
                // Slow spin (3s full circle)
                withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
                // Gradual deep color shift
                Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
                    hue += 0.007
                    if hue > 1 { hue = 0 }
                }
            }
    }
}

#Preview{
    ColorChangingSpinner()
}

