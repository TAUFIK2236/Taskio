
import SwiftUI

@main
struct TodoAppApp: App {
    
    @StateObject var session = UserSession()

    var body: some Scene {
        WindowGroup {
            if session.isLoggedIn {
                NavigationView {
                    HomeView(userId: "234")
                }.environmentObject(session)
            }else{
                NavigationView {
                    SplashView()
                }.environmentObject(session)
                  
                }
            }
        }
    }





