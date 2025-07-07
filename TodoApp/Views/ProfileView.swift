//
//  ProfileView.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/3/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            
            VStack(){
                Image("splashLogo") // Replace with your logo asset name
                    .resizable()
                    .scaleEffect(3)
                    .frame(width: w * 0.18,height: h * 0.06)
                
                
                VStack(spacing: h * 0.03) {
                    Spacer(minLength: h * 0.05)
                    
                    // Profile Icon
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: w * 0.3, height: w * 0.3)
                        .foregroundColor(.gray)
                    
                    // Title
                    Text("Profile")
                        .font(.system(size: w * 0.07, weight: .bold))
                    
                    // Info Fields
                    VStack(alignment: .leading, spacing: h * 0.02) {
                        HStack {
                            Text("Name")
                            Spacer()
                            Text("Your Name")
                        }
                        
                        HStack {
                            Text("ID")
                            Spacer()
                            Text("123456")
                        }
                        
                        HStack {
                            Text("Password")
                            Spacer()
                            Text("*******")
                        }
                    }
                    .padding(.horizontal, w * 0.1)
                    .font(.system(size: w * 0.045))
                    
                    // Buttons
                    VStack(spacing: h * 0.015) {
                        
                        Spacer()
                        Button(action: {}) {
                            Text("Change Password and Name")
                                .font(.system(size: w * 0.05, weight: .bold))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .frame(height: h * 0.07)
                                .background(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: w * 0.05).stroke(Color.gray.opacity(2)))
                        }
                        
                        Button(action: {}) {
                            Text("Delete Account")
                                .font(.system(size: w * 0.06, weight: .bold))
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity)
                                .frame(height: h * 0.07)
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(w * 0.05)
                                
                        }
                        
                    }
                    .padding(.horizontal, w * 0.05)
                    
                    Spacer()
                        .frame(height: w * 0.1)
                }
                .frame(width: w, height: h)
                .background(Color.white)
            }
        }
    }
}

#Preview {
    ProfileView()
}
