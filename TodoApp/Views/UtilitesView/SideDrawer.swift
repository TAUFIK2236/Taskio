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
            VStack(alignment: .leading) {
                Text("Taskio")
                    .font(.title).bold()
                Spacer().frame(height:20)
                Text("Choose any Option")
                    .font(.subheadline)
                
                Divider()
                Spacer()
                Button(action: onLogout) {
                    Text("Log Out")
                        .font(.title3).bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.secondary)
                      
                }
                Button(action: onExit) {
                    Text("Exit")
                        .font(.title3).bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.secondary)
                      
                }
                
                Spacer()
            }
            .padding(.top,40)
            .padding(.leading,20)
            .frame(width: drawerWidth,height: geometry.size.height * 0.90)
            .background(.white) // <-- FROSTED GLASS
            .clipShape(RoundedCorner(radius: 30, corners: [.topRight, .bottomRight]))
            .shadow(radius: 10)
            .offset(x: isOpen ? 0 : -drawerWidth )
            .animation(.default, value: isOpen)
            
            Spacer()
        }
        }
    }
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


//struct ContentView: View {
//    @State private var showDrawer = false
//
//    var body: some View {
//        ZStack {
//            // MAIN CONTENT
//            VStack(spacing: 40) {
//                Text("Welcome to TaskIo")
//                    .font(.largeTitle)
//                Button("Open Drawer") {
//                    withAnimation {
//                        showDrawer = true
//                    }
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .blur(radius: showDrawer ? 8 : 0) // <-- BLUR MAIN SCREEN WHEN DRAWER IS OPEN
//
//            // DRAWER + TAP TO CLOSE
//            if showDrawer {
//                Color.black.opacity(0.1)
//                    .ignoresSafeArea()
//                    .onTapGesture {
//                        withAnimation {
//                            showDrawer = false
//                        }
//                    }
//             
//                SideDrawerView(
//                    isOpen: $showDrawer,
//                    onLogout: { print("Log Out") },
//                    onExit: { exit(0) }
//                ).padding(.top)
//            }
//        }
//    }
//}
//
//
//#Preview{
//    ContentView()
//}
