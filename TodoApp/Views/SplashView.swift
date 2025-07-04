import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var scale: CGFloat = 0.6
    @State private var opacity = 0.0

    var body: some View {
        if isActive {
            LoginView()
        } else {
            ZStack {
                Color(red: 0.96, green: 0.93, blue: 0.89) // creamy background
                    .ignoresSafeArea()

                Image("splashLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.scale = 1.0
                            self.opacity = 1.0
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }
        }
    }
}
