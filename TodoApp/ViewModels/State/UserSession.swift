//
//  UserSession.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/5/25.
//


import Foundation
import SwiftUI

// This class stores info about the current user.
// It updates the UI whenever values change.
class UserSession: ObservableObject {
      @AppStorage("userId") var userId: String = ""
       @AppStorage("username") var username: String = ""
       @AppStorage("email") var email: String = ""
       @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
}
