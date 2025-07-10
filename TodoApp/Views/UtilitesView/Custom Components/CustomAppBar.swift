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
        VStack{
            Spacer()
                .frame(height: 50)
            HStack {
                // Left: Drawer Button
                Button(action: {
                    onMenuTap()
                }) {
                    Image(systemName: "line.3.horizontal")
                        .scaleEffect(1.5)
                        .font(.system(size: width * 0.06))
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                // Center: Logo
                Image("splashLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.5)
                
                Spacer()
                
                // Right: Profile Button
                Button(action: {
                    onProfileTap()
                }) {
                    Image(systemName: "person.circle.fill")
                        .scaleEffect(1.5)
                        .font(.system(size: width * 0.06))
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, width * 0.05)
 
            Spacer()
                .frame(height: 10)

        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.white)
    }
}
