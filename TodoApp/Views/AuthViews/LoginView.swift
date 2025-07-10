import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var session: UserSession
    @StateObject private var loginVm = LoginViewModel()
    @StateObject private var todoVm = TodoViewModel()

    
    @State private var email = ""
    @State private var password = ""
    @State private var navigateToHome = false
    @State private var navigateToRegister = false
    @State private var navigateToReset = false

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    VStack(spacing: geometry.size.height * 0.02) {
                        Spacer(minLength: geometry.size.height * 0.03)

                        Image("splashLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.7)
                            .padding(.top, geometry.size.height * 0.01)

                        Text("Log in")
                            .font(.system(size: geometry.size.width * 0.09, weight: .bold))

                        VStack(alignment: .leading, spacing: geometry.size.height * 0.01) {
                            Text("Email")
                                .font(.system(size: geometry.size.width * 0.04, weight: .semibold))
                                .foregroundColor(.gray)

                            TextField("", text: $email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.07)
                                .padding(.bottom)

                            Text("Password")
                                .font(.system(size: geometry.size.width * 0.04, weight: .semibold))
                                .foregroundColor(.gray)

                            SecureField("", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: geometry.size.width * 0.85)
                                .padding(.bottom)

             
                            Button(action:{
                                navigateToReset = true
                            }){
                                Text("Forget Password?")
                                    .font(.footnote)
                                    .foregroundStyle(.blue)
                                    .padding(.bottom)
                            }
                            .navigationDestination(isPresented: $navigateToReset){
                                ResetPasswordView()
                            }
                            
                            
                                Button(action: {
                                    loginVm.loginUser(email: email, password: password, session: session,todoViewModel: todoVm) {
                                        todoVm.fetchTodos(for: session.userId)
                                    
                                    }})
                                {
                                    Text("Sign in")
                                        .foregroundColor(.white)
                                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.06)
                                        .background(Color.black)
                                        .cornerRadius(10)
                                }
                                .navigationDestination(isPresented:$navigateToHome){
                                    HomeView()
                                }
                         
                            .padding(.vertical)
                        }
                        
                        

                        VStack(alignment: .center) {
                            Text("Don't have an account?")
                                .font(.footnote)
                                .foregroundColor(.gray)

                   
                                Button(action: {
                                    navigateToRegister = true
                                }) {
                                    Text("Sign Up")
                                        .foregroundColor(.white)
                                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.05)
                                        .background(Color.black)
                                        .cornerRadius(10)
                                }
                                .navigationDestination(isPresented:$navigateToRegister) {
                                    RegisterView()
                                }
                            Spacer(minLength: geometry.size.height * 0.5)
                        }

                        
                        
                    }
                    .navigationBarBackButtonHidden(true)
                    if loginVm.isLoading{
                        LoadingOverlay()
                    }
                }
                
                
                .frame(width: geometry.size.width)

            }.ignoresSafeArea(.keyboard)
            .background(Color.white)
        }.alert(isPresented:Binding<Bool>(
            get:{!loginVm.message.isEmpty},
            set:{ _ in loginVm.message = "" }
        )){
            Alert(title:Text("Login Faild"),
                  message: Text(loginVm.message),
                  dismissButton:.default(Text("Try Again"))
            )
            
        }
    }
}

#Preview {
    LoginView()
}

