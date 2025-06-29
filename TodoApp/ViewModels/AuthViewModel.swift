//
//  AuthViewModel.swift
//  TodoApp
//
//  Created by Anika Tabasum on 6/27/25.
//

import Foundation

@MainActor

class AuthViewModel : ObservableObject {
    @Published var isAuthenticated =  false
    @Published var currentUser: User?

//    func login(email: String,password:String)async{
//        //TODO : Call api
//    }
    func register (username:String,Email:String,Password:String)async {
        try? await Task.sleep(nanoseconds: 1_000_000_000)//simulate delay
        self.currentUser = User(id:UUID().uuidString,username:username,email: Email)
        self.isAuthenticated = true
    
        //TODO:call api
    }
    func logout(){
        isAuthenticated = false
        currentUser = nil
    }
    
    func login(email: String, password: String) async {
        try? await Task.sleep(nanoseconds: 1_000_000_000) // simulate delay
        self.currentUser = User(id:"demoid", username: "Guest", email: email)
        self.isAuthenticated = true
    }

}
