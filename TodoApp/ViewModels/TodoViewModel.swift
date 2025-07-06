//
//  TodoViewModel 2.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/5/25.
//


import Foundation

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var message: String = ""

    
    
    
    // MARK: - Create
    func createTodo(userId: String, title: String, description: String) {
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/todos") else { return }

        let body: [String: Any] = [
            "userId": userId,
            "title": title,
            "description": description
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.message = "Error: \(error.localizedDescription)"
                } else {
                    self.message = "Todo created!"
                    self.fetchTodos(for: userId) // refresh list
                }
            }
        }.resume()
    }
    
    

    // MARK: - Fetch
    func fetchTodos(for userId: String) {
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/todos/user/\(userId)") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoded = try JSONDecoder().decode(TodoResponse.self, from: data)
                        self.todos = decoded.todos
                        self.message = ""
                        print("✅ Loaded \(decoded.todos.count) todos")
                    } catch {
                        self.message = "❌ Failed to load todos"
                        print("❌ Decode error: \(error)")
                        if let raw = String(data: data, encoding: .utf8) {
                            print("Raw JSON:", raw)
                        }
                    }
                } else if let error = error {
                    self.message = "❌ Network error: \(error.localizedDescription)"
                    print("❌ Request error: \(error)")
                }
            }
        }.resume()
    }


    
    // MARK: - Update Title/Description
    func updateTodo(todoId: String, newTitle: String, newDescription: String, userId: String) {
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/todos/\(todoId)") else { return }

        let body: [String: String] = [
            "title": newTitle,
            "description": newDescription
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)

        URLSession.shared.dataTask(with: request) { _, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.message = "Update error: \(error.localizedDescription)"
                } else {
                    self.message = "Todo updated"
                    self.fetchTodos(for: userId)
                }
            }
        }.resume()
    }

    
    // MARK: - Mark as Done
    func markTodoDone(todoId: String, userId: String) {
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/todos/\(todoId)/done") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        URLSession.shared.dataTask(with: request) { _, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.message = "Mark done error: \(error.localizedDescription)"
                } else {
                    self.message = "✅ Todo marked as done"
                    self.fetchTodos(for: userId)
                }
            }
        }.resume()
    }

    // MARK: - Unmark as Done
    func unmarkTodo(todoId: String, userId: String) {
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/todos/\(todoId)/undone") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        URLSession.shared.dataTask(with: request) { _, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.message = "Unmark error: \(error.localizedDescription)"
                } else {
                    self.message = "❌ Todo marked as not done"
                    self.fetchTodos(for: userId)
                }
            }
        }.resume()
    }


    
    // MARK: - Delete
    func deleteTodo(todoId: String, userId: String) {
        guard let url = URL(string: "https://todoapi-w1mn.onrender.com/todos/\(todoId)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { _, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.message = "Delete error: \(error.localizedDescription)"
                } else {
                    self.message = "Todo deleted"
                    self.fetchTodos(for: userId)
                }
            }
        }.resume()
    }
}
