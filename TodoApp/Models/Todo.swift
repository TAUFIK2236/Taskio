//
//  Todo.swift
//  TodoApp
//
//  Created by Anika Tabasum on 6/27/25.
//

import Foundation

struct Todo : Identifiable, Codable {
    var id : String
    var task : String
    var description : String
    var isDone: Bool
}
