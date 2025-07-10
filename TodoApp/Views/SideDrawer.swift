import SwiftUI



import SwiftUI

struct SideDrawerView: View {
    
    @Binding var isOpen: Bool
    var onLogout: () -> Void
    var onExit: () -> Void

    var body: some View {
        GeometryReader { geometry in
            let drawerWidth = geometry.size.width * 0.6
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Drawer Title")
                    .font(.title2).bold()
                
                Text("Here is your drawer content.")
                    .font(.subheadline)
                
                Divider()
                
                Button("Log Out", action: onLogout)
                Divider()
                Button("Exit App", action: onExit)
                
                Spacer()
            }
            .padding(.top,40)
            .padding(.horizontal,20)
            .frame(width: drawerWidth,height: geometry.size.height * 0.95)
            .background(.white) // <-- FROSTED GLASS
            .clipShape(RoundedCorner(radius: 30, corners: [.topRight, .bottomRight]))
            .shadow(radius: 10)
            .offset(x: isOpen ? 0 : -drawerWidth )
            .animation(.smooth, value: isOpen)
            
            Spacer()
        }
        }
    }
}




struct ContentView: View {
    @State private var showDrawer = false

    var body: some View {
        ZStack {
            // MAIN CONTENT
            VStack(spacing: 40) {
                Text("Welcome to TaskIo")
                    .font(.largeTitle)
                Button("Open Drawer") {
                    withAnimation {
                        showDrawer = true
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .blur(radius: showDrawer ? 8 : 0) // <-- BLUR MAIN SCREEN WHEN DRAWER IS OPEN

            // DRAWER + TAP TO CLOSE
            if showDrawer {
                Color.black.opacity(0.1)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showDrawer = false
                        }
                    }
             
                SideDrawerView(
                    isOpen: $showDrawer,
                    onLogout: { print("Log Out") },
                    onExit: { exit(0) }
                ).padding(.top)
            }
        }
    }
}


#Preview{
    ContentView()
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = []

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
