import Foundation

class RegisterViewModel: ObservableObject {
    @Published var message: String = ""

    func registerUser(username: String, email: String, password: String, session: UserSession) {
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/users/register") else { return }

        let body = [
            "username": username,
            "email": email,
            "password": password
        ]

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
                if let decoded = try? JSONDecoder().decode(RegisterResponse.self, from: data) {
                    DispatchQueue.main.async {
                        session.userId = decoded.user._id
                        session.username = decoded.user.username
                        session.email = decoded.user.email
                        session.isLoggedIn = true
                        self.message = "Registration successful!"
                    }
                } else {
                    DispatchQueue.main.async {
                        self.message = "User already exists or invalid input."
                    }
                }
            }
        }.resume()
    }
}

