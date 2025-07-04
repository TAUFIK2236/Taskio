import SwiftUI

struct HomeView: View {
    var userId: String
    
    // Sample todos
    
    @State private var isCheckList = Array(repeating: false, count: 6)
    
    // Deep colors
    let colors: [Color] = [
        Color(red: 0.25, green: 0.32, blue: 0.71),
        Color(red: 0.91, green: 0.12, blue: 0.39),
        Color(red: 0.00, green: 0.59, blue: 0.53),
        Color(red: 0.91, green: 0.58, blue: 0.12),
        Color(red: 0.13, green: 0.59, blue: 0.95),
        Color(red: 0.80, green: 0.70, blue: 0.50),
    ]
    
    struct DummyTodo: Identifiable {
        let id = UUID()
        let title: String
        let description: String
    }
    
    let todos = [
        DummyTodo(title: "Buy Groceries", description: "Milk, eggs, bread, apples..."),
        DummyTodo(title: "Workout", description: "Pushups, squats, 20-minute run."),
        DummyTodo(title: "Read", description: "Finish last 3 chapters of book."),
        DummyTodo(title: "Buy Groceries", description: "Milk, eggs, bread, apples..."),
        DummyTodo(title: "Workout", description: "Pushups, squats, 20-minute run."),
        DummyTodo(title: "Read", description: "Finish last 3 chapters of book."),
    ]
    
    
    
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                let w = geo.size.width
                let h = geo.size.height
                ZStack{
                    CustomAppBar(width: geo.size.width)
                        
                    ScrollView {
                        
//
                        VStack(alignment: .leading, spacing: h * 0.03) {
                            
                            // MARK: - Header
                            HStack(alignment: .center, spacing: w * 0.04) {
                                Image("profilePic") // Your image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: w * 0.15, height: w * 0.15)
                                    .clipShape(RoundedRectangle(cornerRadius: w * 0.03))
                                
                                VStack(alignment: .leading, spacing: h * 0.009) {
                                    Text("Hi Syed!")
                                        .font(.system(size: w * 0.06, weight: .bold))
                                    
                                    Text("Good morning!\nYou have \(todos.count) task for today.")
                                        .font(.system(size: w * 0.035))
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal, w * 0.05)
                            .padding(.vertical,h * 0.02)
                            
                            
                            // MARK: - Date
                            Text("Sunday - 18 March, 2018")
                                .font(.system(size: w * 0.045, weight: .semibold))
                                .padding(.horizontal, w * 0.05)
                            
                            // MARK: - Cards
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                                      spacing: h * 0.015) {
                                ForEach(Array(todos.enumerated()), id: \.offset) { index, todo in
                                    
                                    CustomCardButton(index: index, title:todo.title, description:todo.title, width:w*0.95, height: h*1.14, color:colors[index % colors.count], isChecked:$isCheckList[index]) {
                                        print("taped")
                                    }
                                    
                                }
                                
                                // "+" Add Card
                                Button {
                                    // TODO: navigate to add
                                } label: {
                                    VStack {
                                        Image(systemName: "plus")
                                            .font(.system(size: w * 0.08))
                                            .foregroundColor(.gray)
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
                        .padding(.top, h * 0.025)
                       
                    }
                    .padding(.top, 70)
                    .background(Color(red: 0.95, green: 0.97, blue: 1.0))
                    .navigationBarTitleDisplayMode(.inline)
                }
                CustomAppBar(width: geo.size.width)
                    .shadow(radius: 10)
            }
        }
    }
}
#Preview {
    HomeView(userId: "")
}






