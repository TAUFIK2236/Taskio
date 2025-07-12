

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var session: UserSession
    @StateObject private var registerVM = RegisterViewModel()
    
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var message = ""
    @State private var navigateToHome = false
    @State private var navigateToLogin = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack{
                    
                        VStack(spacing: geometry.size.height * 0.02) {
                            Spacer(minLength: geometry.size.height * 0.03)
                            
                            Image("splashLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.5)
                                .padding(.top, geometry.size.height * 0.0)
                            Spacer(minLength: geometry.size.height * 0.06)
                            Text("Create Account")
                                .font(.system(size: geometry.size.width * 0.09, weight: .bold))
                            
                            VStack(alignment: .leading) {
                                Text("Username")
                                    .font(.system(size: geometry.size.width * 0.04, weight: .semibold))
                                    .foregroundColor(.gray)
                                
                                TextField("", text: $username)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: geometry.size.width * 0.85)
                                    .padding(.bottom, geometry.size.height * 0.01)
                                
                                Text("Email")
                                    .font(.system(size: geometry.size.width * 0.04, weight: .semibold))
                                    .foregroundColor(.gray)
                                
                                TextField("", text: $email)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: geometry.size.width * 0.85)
                                    .padding(.bottom, geometry.size.height * 0.01)
                                
                                Text("Password")
                                    .font(.system(size: geometry.size.width * 0.04, weight: .semibold))
                                    .foregroundColor(.gray)
                                
                                SecureField("", text: $password)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: geometry.size.width * 0.85)
                                    .padding(.bottom)
                                

                                
                                
                                Button(action: {
                                    registerVM.registerUser(username: username, email: email, password: password, session: session)
                                }) {
                                    Text("Register")
                                        .foregroundColor(.white)
                                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.06)
                                        .background(Color.black)
                                        .cornerRadius(10)
                                }
                                
                                .padding(.vertical)
                            }
                            
                            VStack(alignment: .center) {
                                Text("Have an account?")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                
                                
                                Button(action: {
                                    navigateToLogin = true
                                }) {
                                    Text("Log In")
                                        .foregroundColor(.white)
                                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.05)
                                        .background(Color.black)
                                        .cornerRadius(10)
                                }.navigationDestination(isPresented: $navigateToLogin){
                                    LoginView()
                                }
                                
                            }
                            Spacer(minLength: geometry.size.height * 0.1)
                        }
                        
                    if registerVM.isLoading{
                        LoadingOverlay()
                       }

                    if !registerVM.message.isEmpty {
                         ZStack {
                             CustomAlertCard(
                                Atitle:"Sorry !", textColor:.purple,
                                message: registerVM.message,
                                 primaryButtonTitle: "OK",
                                 secondaryButtonTitle: "Try Again",
                                 primaryAction: {
                                     registerVM.message = ""
                                 },
                                 secondaryAction: {
                                     registerVM.message = ""
                                     // Optionally reset fields if needed

                                 }
                             )
                            
                         }
                         .padding(.bottom, 300)
                         .transition(.move(edge: .top).combined(with: .opacity))
                         .animation(.easeInOut(duration: 0.3), value: registerVM.message)
                     }
                    }
                    .frame(width: geometry.size.width)
                    .ignoresSafeArea(.keyboard)
                    .navigationBarBackButtonHidden(true)
                }
                .background(Color.white)
            }
        }
    }


#Preview {
    RegisterView()
}


