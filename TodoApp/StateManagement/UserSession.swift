//
//  UserSession.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/5/25.
//


import Foundation

// This class stores info about the current user.
// It updates the UI whenever values change.
class UserSession: ObservableObject {
    @Published var userId: String = ""        // Used for API calls (todos, updates)
    @Published var username: String = ""      // Shown in profile and home
    @Published var email: String = ""         // Used in reset password
    @Published var isLoggedIn: Bool = false   // Controls login/logout flow
}
