import Foundation

class RegisterViewModel: ObservableObject {
    @Published var message: String = ""
    @Published var isLoading = false
    
    func registerUser(username: String, email: String, password: String, session: UserSession) {
        isLoading = true
        message = ""
        
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/users/register") else {
            isLoading = false
            return
        }
        
        let body = [
            "username": username,
            "email": email,
            "password": password
        ]
        
        guard let jsonData = try? JSONEncoder().encode(body) else {
            isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                self.isLoading = false  // always stop loading when response is received
                
                if let error = error {
                    self.message = "Error: \(error.localizedDescription)"
                    return
                }
                
                guard let data = data else {
                    self.message = "No response from server."
                    return
                }
                
                if let decoded = try? JSONDecoder().decode(RegisterResponse.self, from: data) {
                    session.userId = decoded.user._id
                    session.username = decoded.user.username
                    session.email = decoded.user.email
                    session.isLoggedIn = true
                    self.message = "Registration successful!"
                } else {
                    self.message = "User already exists or invalid input."
                }
            }
        }.resume()
    }
}
        
    

