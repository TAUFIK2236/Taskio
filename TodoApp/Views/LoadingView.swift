import SwiftUI

struct LoadingView: View {
    @State private var scale: CGFloat = 1.0
    @State private var isVisible = true

    var onFinish: () -> Void = { }

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(spacing: 40){
                Image("splashLogo") // your PNG file in Assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                            scale = 1.2 // Heart-beating effect
                        }
                        
                        // Simulate loading delay (e.g. 3 seconds)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.easeOut(duration: 1.0)) {
                                isVisible = false
                            }
                            
                            // Notify that loading is done
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                onFinish()
                            }
                        }
                    }

                ColorChangingSpinner()
                
            }
        }
        .opacity(isVisible ? 1 : 0)
    }
}


#Preview {
    LoadingView()
}
