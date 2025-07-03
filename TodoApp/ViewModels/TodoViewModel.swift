//
//  TodoViewModel.swift
//  TodoApp
//
//  Created by Anika Tabasum on 6/27/25.
//

import Foundation

@MainActor
class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []

    func fetchTodos(for userId: String) async {
        guard let url = URL(string: "\(Constants.baseURL)/api/todos/user/\(userId)") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let todos = try JSONDecoder().decode([Todo].self, from: data)
            self.todos = todos
        } catch {
            print("Fetch todos error: \(error.localizedDescription)")
        }
    }

    func createTodo(userId: String, task: String, description: String) async {
        guard let url = URL(string: "\(Constants.baseURL)/api/todos/create") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "userId": userId,
            "task": task,
            "description": description
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        do {
            let (_, _) = try await URLSession.shared.data(for: request)
            await fetchTodos(for: userId)
        } catch {
            print("Create todo error: \(error.localizedDescription)")
        }
    }

    func deleteTodo(_ id: String) async {
        guard let url = URL(string: "\(Constants.baseURL)/api/todos/\(id)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        do {
            let (_, _) = try await URLSession.shared.data(for: request)
        } catch {
            print("Delete todo error: \(error.localizedDescription)")
        }
    }
}
