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

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
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
                            NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                                Button(action: {
                                    navigateToLogin = true
                                }) {
                                    Text("Reset Password")
                                        .foregroundColor(.white)
                                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.06)
                                        .background(Color.black)
                                        .cornerRadius(10)
                                }
                            }
                            .padding(.vertical)
                        }

                        // Back to Login
                        VStack(alignment: .center) {
                            Text("Remember your password?")
                                .font(.footnote)
                                .foregroundColor(.gray)

                            NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                                Button(action: {
                                    navigateToLogin = true
                                }) {
                                    Text("Back to Sign In")
                                        .foregroundColor(.white)
                                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.05)
                                        .background(Color.black)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }

                    Spacer(minLength: geometry.size.height * 0.1)
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

