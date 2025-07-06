//
//  ProfileEditVM.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/5/25.
//

import Foundation
import Foundation

class ProfileEditViewModel: ObservableObject {
    @Published var message: String = ""

    // MARK: - Update Username
    func updateUsername(userId: String, newUsername: String, session: UserSession) {
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/users/\(userId)/username") else { return }

        let body = ["username": newUsername]
        guard let jsonData = try? JSONEncoder().encode(body) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
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
                if let decoded = try? JSONDecoder().decode(UpdateUsernameResponse.self, from: data) {
                    DispatchQueue.main.async {
                        session.username = decoded.user.username
                        self.message = "Username updated!"
                    }
                } else {
                    DispatchQueue.main.async {
                        self.message = "Failed to update username."
                    }
                }
            }
        }.resume()
    }

    // MARK: - Reset Password
    func resetPassword(email: String, newPassword: String, session: UserSession) {
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/users/reset-password") else { return }

        let body = ["email": email, "password": newPassword]
        guard let jsonData = try? JSONEncoder().encode(body) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
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
                if let decoded = try? JSONDecoder().decode(ResetPasswordResponse.self, from: data) {
                    DispatchQueue.main.async {
                        session.userId = decoded.user._id
                        session.username = decoded.user.username
                        session.email = decoded.user.email
                        session.isLoggedIn = true
                        self.message = "Password updated!"
                    }
                } else {
                    DispatchQueue.main.async {
                        self.message = "Failed to reset password."
                    }
                }
            }
        }.resume()
    }
    
    // MARK: - Delete User
    func deleteUser(userId: String, session: UserSession) {
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/users/\(userId)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.message = "Error: \(error.localizedDescription)"
                } else {
                    // Clear session after deletion
                    session.userId = ""
                    session.username = ""
                    session.email = ""
                    session.isLoggedIn = false
                    self.message = "User deleted successfully."
                }
            }
        }.resume()
    }
    
    
}
