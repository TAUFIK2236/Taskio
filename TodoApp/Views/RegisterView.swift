//
//  RegisterView.swift
//  TodoApp
//
//  Created by Anika Tabasum on 6/27/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showHome = false
    @State private var isLoading = false
    @State private var navigate = false
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        NavigationStack{
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: geometry.size.height * 0.02) {
                    Spacer(minLength: geometry.size.height * 0.03)
                    
                    // Logo Image
                    Image("splashLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                        .padding(.top, geometry.size.height * 0.0)
                    
                    // Title
                    Text("Create Account")
                        .font(.system(size: geometry.size.width * 0.09, weight: .bold))
                    
                    // Input Fields and Button
                    
                    
                    VStack(alignment: .leading) {
                        
                        Text("Username")
                            .font(.system(size: geometry.size.width * 0.04, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        TextField("", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: geometry.size.width * 0.85 )
                            .padding(.bottom, geometry.size.height * 0.01)
                        
                        
                        Text("Email")
                            .font(.system(size: geometry.size.width * 0.04, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        TextField("", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: geometry.size.width * 0.85 )
                            .padding(.bottom, geometry.size.height * 0.01)
                        
                        Text("Password")
                            .font(.system(size: geometry.size.width * 0.04, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        SecureField("", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: geometry.size.width * 0.85)
                            .padding(.bottom)
                        
                        if isLoading {
                            ProgressView()
                        } else {
                            Button(action:{
                                Task {
                                    isLoading = true
                                    await authVM.register(username:username, Email:email, Password:password)
                                    isLoading = false
                                    if authVM.isAuthenticated {
                                        withAnimation(.easeInOut) {
                                            showHome = true
                                        }
                                    }
                                }
                            }) {
                                Text("Register")
                                    .foregroundColor(.white)
                                    .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.06)
                                    .background(Color.black)
                                    .cornerRadius(10)
                            }.padding(.vertical)
                        }
                    }
                    
                    VStack (alignment:.center){
                        Text("Have an account?")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        
                        Button(action: {
                            navigate = true
                        }) {
                            Text("Sign In")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.05)
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                        .navigationDestination(isPresented:$navigate) {
                            LoginView()
                        }
                       
                        
                    }
                    
                    
                }
                
                Spacer(minLength: geometry.size.height * 0.1)

            }
            .frame(width: geometry.size.width)
            .ignoresSafeArea(.keyboard)
            
        } .background(Color.white)//body
        
        }.navigationDestination(isPresented:$showHome){HomeView()}
        
}
}



#Preview {
    RegisterView()
}
