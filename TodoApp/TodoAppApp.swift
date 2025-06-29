//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Anika Tabasum on 6/27/25.
//

import SwiftUI

@main
struct TodoAppApp: App {
    @StateObject var authVM = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(authVM)
        }
    }
}
