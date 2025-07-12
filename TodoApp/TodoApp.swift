
import SwiftUI


@main
struct TodoAppApp: App {
    @StateObject var session = UserSession()
    @StateObject var networkMonitor = NetworkMonitor()

    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            showSplash = false
                        }
                    }
                    .environmentObject(session)
                    .environmentObject(networkMonitor)
            } else {
                if !networkMonitor.isConnected {
                    NoConnectionView()
                        .environmentObject(session)
                        .environmentObject(networkMonitor)
                } else {
                    if session.isLoggedIn {
                        NavigationView {
                            HomeView()
                        }
                        .environmentObject(session)
                        .environmentObject(networkMonitor)
                    } else {
                        NavigationView {
                            LoginView()
                        }
                        .environmentObject(session)
                        .environmentObject(networkMonitor)
                    }
                }
            }
        }
    }
}
