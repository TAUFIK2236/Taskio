
import Foundation

class LoginViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var message: String = ""
    @Published var showAlert : Bool = false
    @Published var alertMessage : String = ""
    

    // Login method with session injected
    func loginUser(
        email: String,
        password: String,
        session: UserSession,
        todoViewModel: TodoViewModel,
        onSuccess: @escaping () -> Void
        
    )
    
    {   isLoading = true
        alertMessage = " "
        showAlert = false
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/users/login") else {
            isLoading = false
            return }

        let body = ["email": email, "password": password]
        guard let jsonData = try? JSONEncoder().encode(body) else {
            isLoading = false
            return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, _, error in
            
//            DispatchQueue.main.async {
//               // self.alertMessage = " NetWork Error: \(String(describing: error?.localizedDescription))"
//                self.showAlert = false
//            }
            if let error = error {
                DispatchQueue.main.async {
                    self.message = "Network Error: \(error.localizedDescription)"
                    self.isLoading = false
                    self.showAlert = true
                    print("Failed login ")
                }
                return
            }

            if let data = data {
                if let decoded = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                    DispatchQueue.main.async {
                        session.userId = decoded.user._id
                        session.username = decoded.user.username
                        session.email = decoded.user.email
                        session.isLoggedIn = true
                        self.isLoading = false
                        onSuccess()
                        
                    }
                } else {
                    DispatchQueue.main.async {
                        self.message = "Invalid email or password"
                        self.showAlert = true
                        self.isLoading = false
                        if let raw  = String(data : data,encoding: .utf8){
                            print("Raw login Response : \(raw)")
                        }
                            
                       // print("Decode error : ",error)
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.message = "No reponse from server"
                    self.isLoading = false
                    self.showAlert = true
                }
            }
        }.resume()
    }
}
