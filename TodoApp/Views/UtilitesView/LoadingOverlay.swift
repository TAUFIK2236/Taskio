import SwiftUI

struct LoadingOverlay: View {
    @State private var scale: CGFloat = 1.0
    @State private var isVisible = true

    var onFinish: () -> Void = { }

    var body: some View {
        ZStack(alignment:.top) {
            Color.white.ignoresSafeArea()
            VStack(spacing: 200){
                Image("splashLogo") // your PNG file in Assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .scaleEffect(scale)

              //  Spacer()
                ColorChangingSpinner().padding(.bottom,60)
                
            }
        }
    }
}


#Preview {
    LoadingOverlay()
}
