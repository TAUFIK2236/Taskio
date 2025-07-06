//
//  CustomAppBar.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/3/25.
//

import SwiftUI

import SwiftUI

struct CustomAppBar: View {
    let width: CGFloat

    // Add these closures for external actions
    var onMenuTap: () -> Void = {}
    var onProfileTap: () -> Void = {}

    var body: some View {
        HStack {
            // Left: Drawer Button
            Button(action: {
                onMenuTap()
            }) {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: width * 0.06))
                    .foregroundColor(.black)
            }

            Spacer()

            // Center: Logo
            Image("splashLogo")
                .resizable()
                .scaledToFill()
                .frame(width: width * 0.5)

            Spacer()

            // Right: Profile Button
            Button(action: {
                onProfileTap()
            }) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: width * 0.06))
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal, width * 0.05)
        .padding(.top, 12)
        .background(Color.white)
        .ignoresSafeArea(.all, edges: .top)
        .frame(height: 95)
    }
}
