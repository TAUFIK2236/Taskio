
import Foundation

class LoginViewModel: ObservableObject {
    @Published var message: String = ""

    // Login method with session injected
    func loginUser(email: String, password: String, session: UserSession) {
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
                    }
                } else {
                    DispatchQueue.main.async {
                        self.message = "Invalid email or password"
                    }
                }
            }
        }.resume()
    }
}
