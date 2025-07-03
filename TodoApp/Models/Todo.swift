//
//  Todo.swift
//  TodoApp
//
//  Created by Anika Tabasum on 6/27/25.
//

import Foundation

struct Todo: Identifiable, Codable {
    let id: String
    let task: String
    let description: String
    let isDone: Bool
}


