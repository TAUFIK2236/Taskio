//
//  TodoViewModel.swift
//  TodoApp
//
//  Created by Anika Tabasum on 6/27/25.
//

import Foundation

@MainActor
class TodoViewModel: ObservableObject {
    @Published var todos : [Todo] = []
    
    let baseURL = "https://todoapi-w1mn.onrender.com/todos"
//    var userId: String {
//        return AuthViewModel().currentUser?.id ?? "demoid"
//    }

   let userId = "6860a4408e90e24c38a97655"
    
    func  fetchTodos() async {
        guard let url = URL(string: "\(baseURL)/user/\(userId)") else {return}
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let fetched = try JSONDecoder().decode([Todo].self, from:data)
            self.todos = fetched
        } catch { print("Error fetching todos: ", error.localizedDescription)}
    }
    
    
    func createTodo(task:String,description:String) async {
        guard let url = URL(string: baseURL)else {return}
        let newTodo = ["userId":userId,"title":task,"description":description]
        guard let body = try? JSONSerialization.data(withJSONObject: newTodo)else{return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField:"Content-Type")
        
        do{
            let(_, respose) =  try await URLSession.shared.data(for: request)
            if let httpResponse = respose as? HTTPURLResponse, httpResponse.statusCode == 201{
                await fetchTodos()
            }
        }catch {print("Error creating todo:",error.localizedDescription)}
    }
    
    
    func updateTodo (_ todo: Todo) async {
        //TODO: CALL API
    }
    func deleteTodo(_ id:String)async{
        guard let url = URL(string: "\(baseURL)/\(id)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                await fetchTodos()
            }
        } catch {
            print("Error deleting todo:", error.localizedDescription)
        }
        
    }
}




