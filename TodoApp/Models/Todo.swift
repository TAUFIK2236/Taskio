
import Foundation

struct Todo: Codable, Identifiable {
    let _id: String
    let userId: String
    var title: String
    var description: String
    var completed: Bool

    var id: String { _id } // So we can use it in ForEach
}

struct TodoResponse: Codable {
    let todos: [Todo]
}
