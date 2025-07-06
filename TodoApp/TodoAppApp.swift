
import SwiftUI

@main
struct TodoAppApp: App {
    
    @StateObject var session = UserSession()

    var body: some Scene {
        WindowGroup {
            if session.isLoggedIn {
                NavigationView {
                    HomeView1()
                }.environmentObject(session)
            }else{
                NavigationView {
                    SplashView()
                }.environmentObject(session)
                  
                }
            }
        }
    }





