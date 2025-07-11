//
//  ResetPassView.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/3/25.
//

import SwiftUI

struct ResetPasswordView: View {
  

    @State private var email = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var navigateToLogin = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToHome = false
    @EnvironmentObject var session: UserSession
    @StateObject var profileVM = ProfileEditViewModel()
    
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack{
                    VStack(spacing: geometry.size.height * 0.02) {
                        Spacer(minLength: geometry.size.height * 0.03)
                        
                        // Logo
                        Image("splashLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.6)
                            .padding(.top, geometry.size.height * 0.01)
                        
                        
                        
                        // Title
                        Text("Reset Password")
                            .font(.system(size: geometry.size.width * 0.08, weight: .bold))
                        
                        // Input Section
                        VStack(alignment: .leading, spacing: geometry.size.height * 0.01) {
                            // Email
                            Text("Email")
                                .font(.system(size: geometry.size.width * 0.04, weight: .semibold))
                                .foregroundColor(.gray)
                            
                            TextField("", text: $email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.07)
                                .padding(.bottom)
                            
                            // New Password
                            Text("New Password")
                                .font(.system(size: geometry.size.width * 0.04, weight: .semibold))
                                .foregroundColor(.gray)
                            
                            SecureField("", text: $newPassword)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: geometry.size.width * 0.85)
                                .padding(.bottom)
                            
                            // Confirm Password
                            Text("Confirm Password")
                                .font(.system(size: geometry.size.width * 0.04, weight: .semibold))
                                .foregroundColor(.gray)
                            
                            SecureField("", text: $confirmPassword)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: geometry.size.width * 0.85)
                                .padding(.bottom)
                            
                            // Reset Button
                            
                            Button(action: {
                                profileVM.resetPassword(email: email, newPassword: newPassword, session: session)
                            }) {
                                Text("Reset Password")
                                    .foregroundColor(.white)
                                    .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.06)
                                    .background(Color.black)
                                    .cornerRadius(10)
                            }
 
 
                            
                            .padding(.vertical)
                        }
                        
                        
                        // Back to Login
                        VStack(alignment: .center) {
                            Text("Remember your password?")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Button(action: {
                                navigateToLogin = true
                            }) {
                                Text("Back to Sign In")
                                    .foregroundColor(.white)
                                    .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.05)
                                    .background(Color.black)
                                    .cornerRadius(10)
                            } .navigationDestination(isPresented: $navigateToLogin) {
                                LoginView()}
                        }
                        Spacer(minLength: geometry.size.height * 0)
                    }
                    if profileVM.isLoading{
                        LoadingOverlay()
                    }
                    if !profileVM.message.isEmpty {
                        ZStack {
                            CustomAlertCard(
                                Atitle:"Sorry !", textColor:.purple,
                                message: profileVM.message,
                                primaryButtonTitle: "OK",
                                secondaryButtonTitle: "Try Again",
                                primaryAction: {
                                    profileVM.message = ""
                                    // Optional: navigateToLogin = true
                                },
                                secondaryAction: {
                                    profileVM.message = ""
                                    email = ""
                                    newPassword=""
                                    confirmPassword = ""
                                    
                                })
                               
                            
                           
                        }
                        .padding(.bottom, 300)
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .animation(.easeInOut, value: profileVM.message)
                        
                    }
                }
                
                .frame(width: geometry.size.width)
                .ignoresSafeArea(.keyboard)
            }
            .background(Color.white)
            
            
 
        }
    }
        
}

#Preview {
    ResetPasswordView()
}

