//
//  CustomAppBar.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/3/25.
//

import SwiftUI

struct CustomAppBar: View {
    let width: CGFloat
    
    var body: some View {
        HStack {
            // Left: Menu icon
            Button(action: {
                // TODO: Open drawer menu
            }) {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: width * 0.06))
                    .foregroundColor(.black)
            }

            Spacer()

            // Center: Taskio logo and name
            
                Image("splashLogo") // your Taskio icon
                    .resizable()
                    .font(.system(size: width * 0.06))
                    .foregroundColor(.black)
                    .scaledToFill()
                    .frame(width:width * 0.5)
    

            Spacer()

            // Right: Calendar icon
            Button(action: {
                // TODO: Open calendar or task log
            }) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: width * 0.06))
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal, width * 0.05)
        .padding(.top,12)
        .background(Color.white)
        .ignoresSafeArea(.all,edges: .top)
        .frame(height: 95)
    }
}
