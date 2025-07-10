
import Foundation

class LoginViewModel: ObservableObject {
   // var todoViewModel: TodoViewModel?
    @Published var message: String = ""
    

    // Login method with session injected
    func loginUser(
        email: String,
        password: String,
        session: UserSession,
        todoViewModel: TodoViewModel,
        onSuccess: @escaping () -> Void
        
    )
    
    {
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/users/login") else { return }

        let body = ["email": email, "password": password]
        guard let jsonData = try? JSONEncoder().encode(body) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.message = "Error: \(error.localizedDescription)"
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
                        
                      //  todoViewModel.fetchTodos(for: session.userId)
                        
                        session.isLoggedIn = true
                        onSuccess()
                        
                    }
                } else {
                    DispatchQueue.main.async {
                        self.message = "Invalid email or password"
                        if let raw  = String(data : data,encoding: .utf8){
                            print("Raw login Response : \(raw)")
                        }
                            
                        print("Decode error : ",error)
                    }
                }
            }
        }.resume()
    }
}
