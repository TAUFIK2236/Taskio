//import SwiftUI
//
//struct HomeView: View {
//    
//    @EnvironmentObject var session : UserSession
//    @StateObject private var todoVM = TodoViewModel()
//    
//    var userId: String
//    
//    
//    
//    // Deep colors
//    let colors: [Color] = [
//        Color(red: 0.25, green: 0.32, blue: 0.71),
//        Color(red: 0.91, green: 0.12, blue: 0.39),
//        Color(red: 0.00, green: 0.59, blue: 0.53),
//        Color(red: 0.91, green: 0.58, blue: 0.12),
//        Color(red: 0.13, green: 0.59, blue: 0.95),
//        Color(red: 0.80, green: 0.70, blue: 0.50),
//    ]
//    
//    
//    var body: some View {
//        NavigationStack {
//            GeometryReader { geo in
//                let w = geo.size.width
//                let h = geo.size.height
//                ZStack{
//                    CustomAppBar(width: geo.size.width)
//                        
//                    ScrollView {
//                        
////
//                        VStack(alignment: .leading, spacing: h * 0.03) {
//                            
//                            // MARK: - Header
//                            HStack(alignment: .center, spacing: w * 0.04) {
//                                Image("profilePic") // Your image
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: w * 0.15, height: w * 0.15)
//                                    .clipShape(RoundedRectangle(cornerRadius: w * 0.03))
//                                
//                                VStack(alignment: .leading, spacing: h * 0.009) {
//                                    Text("Hi \(session.username)!")
//                                        .font(.system(size: w * 0.06, weight: .bold))
//                                    
//                                    Text("Good morning!\nYou have \($todoVM.todos.count) task for today.")
//                                        .font(.system(size: w * 0.035))
//                                        .foregroundColor(.gray)
//                                }
//                            }
//                            .padding(.horizontal, w * 0.05)
//                            .padding(.vertical,h * 0.02)
//                            
//                            
//Text(Date(), style: .date)
//    .font(.headline)
//    .padding(.horizontal)

//                            
//                            // MARK: - Cards
//                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
//                                      spacing: h * 0.015) {
//                                ForEach(Array(todoVM.todos.enumerated(), id: \.element._id)) { index, todo in
//                                    
//                                    CustomCardButton(index: index, title:todo.title, description:todo.description, width:w*0.95, height: h*1.14, color:colors[index % colors.count], isChecked:todo.completed) {
//                                        print("taped")
//                                    }
//                                    
//                                }
//                                
//                                // "+" Add Card
//                                Button {
//                                    // TODO: navigate to add
//                                } label: {
//                                    VStack {
//                                        Image(systemName: "plus")
//                                            .font(.system(size: w * 0.08))
//                                            .foregroundColor(.gray)
//                                    }
//                                    .frame(height: h * 0.25)
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color.white)
//                                    .cornerRadius(w * 0.04)
//                                    .shadow(color: .gray.opacity(0.2), radius: w * 0.02)
//                                    .padding(.horizontal, w * 0.01)
//                                }
//                            }
//                                      .padding(.horizontal, w * 0.02)
//                        }
//                        .padding(.top, h * 0.025)
//                       
//                    }
//                    .padding(.top, 70)
//                    .background(Color(red: 0.95, green: 0.97, blue: 1.0))
//                    .navigationBarTitleDisplayMode(.inline)
//                }
//                CustomAppBar(width: geo.size.width)
//                    .shadow(radius: 10)
//            }
//        }
//    }
//}
//#Preview {
//    HomeView(userId: "")
//}

//
//import SwiftUI
//
//struct HomeView: View {
//    @EnvironmentObject var session: UserSession
//    @StateObject private var todoVM = TodoViewModel()
//
//   // var userId: String
//
//    let screen = UIScreen.main.bounds
//    let colors: [Color] = [
//        Color(red: 0.25, green: 0.32, blue: 0.71),
//        Color(red: 0.91, green: 0.12, blue: 0.39),
//        Color(red: 0.00, green: 0.59, blue: 0.53),
//        Color(red: 0.91, green: 0.58, blue: 0.12),
//        Color(red: 0.13, green: 0.59, blue: 0.95),
//        Color(red: 0.80, green: 0.70, blue: 0.50),
//    ]
//
//    var body: some View {
//        NavigationStack {
//            ZStack(alignment: .top) {
//                Color(red: 0.95, green: 0.97, blue: 1.0)
//                    .ignoresSafeArea()
//
//                VStack(spacing: 0) {
//                    CustomAppBar(width: screen.width)
//                        .shadow(radius: 5)
//
//                    ScrollView {
//                        VStack(alignment: .leading, spacing: 20) {
//
//                            // MARK: - Header
//                            HStack(spacing: 16) {
//                                Image("profilePic")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 60, height: 60)
//                                    .clipShape(RoundedRectangle(cornerRadius: 12))
//
//                                VStack(alignment: .leading, spacing: 4) {
//                                    Text("Hi \(session.username)!")
//                                        .font(.title2.bold())
//                                    Text("ID \(session.userId)!")
//                                        .font(.title2.bold())
//
//                                    Text("Good morning!\nYou have \(todoVM.todos.count) task(s) for today.")
//                                        .font(.subheadline)
//                                        .foregroundColor(.gray)
//                                }
//                            }
//                            .padding(.horizontal)
//
//                            // MARK: - Date
//                            Text(Date(), style: .date)
//                                .font(.headline)
//                                .padding(.horizontal)
//
//                            // MARK: - Cards
//                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
//                                ForEach(Array(todoVM.todos.enumerated()), id: \.element._id) { index, todo in
//                                    CustomCardButton(
//                                        index: index,
//                                        title: todo.title,
//                                        description: todo.description,
//                                        width: screen.width * 0.44,
//                                        height: 220,
//                                        color: colors[index % colors.count],
//                                        isChecked: todo.completed,
//                                        onTap: {
//                                            print("Tapped: \(todo.title)")
//                                        },
//                                        onCheckToggle: {
//                                            if todo.completed {
//                                                todoVM.unmarkTodo(todoId: todo._id, userId: session.userId)
//                                            } else {
//                                                todoVM.markTodoDone(todoId: todo._id, userId: session.userId)
//                                            }
//                                        }
//                                    )
//                                }
//
//                                // "+" Add Card
//                                Button {
//                                    // TODO: navigate to CreateTodoView
//                                } label: {
//                                    VStack {
//                                        Image(systemName: "plus")
//                                            .font(.system(size: 30))
//                                            .foregroundColor(.gray)
//                                    }
//                                    .frame(height: 220)
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color.white)
//                                    .cornerRadius(18)
//                                    .shadow(color: .gray.opacity(0.2), radius: 4)
//                                }
//                            }
//                            .padding(.horizontal)
//                        }
//                        .padding(.top, 20)
//                        .padding(.bottom, 40)
//                    }
//                }
//            }
//            .onAppear {
//                todoVM.fetchTodos(for: session.userId)
//            }
//        }
//    }
//}
//
//#Preview {
//    HomeView()
//        .environmentObject(UserSession())
//}




import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: UserSession
    @StateObject private var todoVM = TodoViewModel()
    @State private var navigateProfile = false
    @State private var selectedTodo: Todo?
    @State private var showDrawer = false
    @State private var showLogoutAlert = false

    
    let colors: [Color] = [
        Color(red: 0.25, green: 0.32, blue: 0.71),
        Color(red: 0.91, green: 0.12, blue: 0.39),
        Color(red: 0.00, green: 0.59, blue: 0.53),
        Color(red: 0.91, green: 0.58, blue: 0.12),
        Color(red: 0.13, green: 0.59, blue: 0.95),
        Color(red: 0.80, green: 0.70, blue: 0.50),
    ]

    var body: some View {
        
        NavigationStack {
            GeometryReader { geo in
                let w = geo.size.width
                let h = geo.size.height

                ZStack {
                    Color(red: 0.95, green: 0.97, blue: 1.0).edgesIgnoringSafeArea(.all)

                    VStack(spacing: 0) {
                        CustomAppBar(
                            width: w,
                            onMenuTap: { showDrawer.toggle() },
                            onProfileTap: {
                            navigateProfile = true
                        })
                            .shadow(radius: 10)
                            .navigationDestination(isPresented:$navigateProfile){
                                ProfileView()
                            }
                        ScrollView {
                            VStack(alignment: .leading, spacing: h * 0.04) {
                                headerView(w: w, h: h)
                                dateView(w: w)
                                todoGrid(w: w, h: h)
                            }
                            .padding(.top, h * 0.02)
                            Spacer()
                                .frame(height:40 )
                        }
                    }
                    .blur(radius: showDrawer ? 8 : 0)

                    // Drawer + dim background
                    if showDrawer {
                        Color.black.opacity(0.15)
                           // .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    showDrawer = false
                                }
                            }

                        SideDrawerView(
                            isOpen: $showDrawer,
                            onLogout: { showLogoutAlert = true },
                            onExit: { exit(0) }
                        )
                        .padding(.top,h * 0.1)
                    }
                    if showLogoutAlert{
                        CustomAlertCard(
                            Atitle:"Log Out",
                            textColor: .orange,
                            message:"Are you sure ? ",
                            primaryButtonTitle:"Yes",
                            secondaryButtonTitle:"No",
                            primaryAction:{
                                session.userId = ""
                                session.username = ""
                                session.email = ""
                                session.isLoggedIn = false
                        } , secondaryAction:{
                            showLogoutAlert = false
                        }
                            
                        )
                    }
//                    if !todoVM.toastMessage.isEmpty {
//                        VStack {
//                            Spacer()
//                            CustomToast(
//                                icon: "checkmark.circle.fill",
//                                message: todoVM.toastMessage,
//                                background: Color.white,
//                                textColor: .green,
//                                iconColor: .green
//                            )
//                            .transition(.move(edge: .bottom).combined(with: .opacity))
//                            .animation(.easeInOut(duration: 0.3), value: todoVM.toastMessage)
//                        }
//                        .padding(.bottom, 40)
//                    }

                } .navigationBarBackButtonHidden(true)
                    .onAppear {
                        todoVM.fetchTodos(for: session.userId)
                }
//                .onChange(of: todoVM.toastMessage) { newValue in
//                        if !newValue.isEmpty {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                                todoVM.toastMessage = ""
//                            }
//                        }
//                    }

                
            }.ignoresSafeArea()
        }
    }

    // MARK: - Header View
    private func headerView(w: CGFloat, h: CGFloat) -> some View {
        let profileImage = Image("profilePic")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: w * 0.15, height: w * 0.15)
            .clipShape(RoundedRectangle(cornerRadius: w * 0.03))

        let greetingText = VStack(alignment: .leading, spacing: h * 0.009) {
            Text("Hi \(session.username)!")
                .font(.system(size: w * 0.06, weight: .bold))

            Text("Good morning!\nYou have \(todoVM.todos.count) task(s) today.")
                .font(.system(size: w * 0.035))
                .foregroundColor(.gray)
        }

        return HStack(alignment: .center, spacing: w * 0.04) {
            profileImage
            greetingText
        }
        .padding(.horizontal, w * 0.05)
        .padding(.vertical, h * 0.02)
    }

    // MARK: - Date View
    private func dateView(w: CGFloat) -> some View {
        
        Text(Date(), style: .date)
            .font(.system(size: w * 0.045, weight: .semibold))
            .padding(.horizontal, w * 0.05)
    }
    
    
    

    // MARK: - Todo Grid View
    private func todoGrid(w: CGFloat, h: CGFloat) -> some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                  spacing: h * 0.015) {
            ForEach(Array(todoVM.todos.enumerated()), id: \.element._id) { index, todo in
                NavigationLink(destination:TaskDetailsView(todo: todo,todoViewModel:todoVM)) {CustomCardButton(
                    
                    index: index,
                    title: todo.title,
                    description: todo.description,
                    width: w * 0.95,
                    height: h * 1.14,
                    color: colors[index % colors.count],
                    isChecked: todo.completed,
                    onCheckToggle: {todoVM.setTodoCompletion(todoId: todo.id, completed:!todo.completed, userId:session.userId)}
                    
                    
                 )
                }
                
            }

            NavigationLink(destination:  CreateTodoView(userId: session.userId)){
                VStack {
                    Image(systemName: "plus")
                        .font(.system(size: w * 0.15))
                        .foregroundColor(.blue)
                        
                    Text("Add Task")
                        .font(.system(size: w * 0.04,weight: .bold))
                }
                .frame(height: h * 0.25)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(w * 0.04)
                .shadow(color: .gray.opacity(0.2), radius: w * 0.02)
                .padding(.horizontal, w * 0.01)
            
                }
                    }
        .padding(.horizontal, w * 0.02)
    }
}

// MARK: - Preview
#Preview {
    HomeView()
        .environmentObject(UserSession())
}

