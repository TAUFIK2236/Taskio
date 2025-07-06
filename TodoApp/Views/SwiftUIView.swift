//import SwiftUI
//
//struct HomeView1: View {
//    @EnvironmentObject var session: UserSession
//    @StateObject private var todoVM = TodoViewModel()
//
//    var body: some View {
//        NavigationStack {
//            VStack(alignment: .leading) {
//                Text("Hi, \(session.username)!")
//                    .font(.largeTitle)
//                    .bold()
//                    .padding(.top)
//
//                Text("You have \(todoVM.todos.count) tasks")
//                    .foregroundColor(.gray)
//                    .padding(.bottom)
//
//                List {
//                    ForEach(todoVM.todos) { todo in
//                        HStack {
//                            Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
//                                .foregroundColor(todo.completed ? .green : .gray)
//                                .onTapGesture {
//                                    if todo.completed {
//                                        todoVM.unmarkTodo(todoId: todo._id, userId: session.userId)
//                                    } else {
//                                        todoVM.markTodoDone(todoId: todo._id, userId: session.userId)
//                                    }
//                                }
//
//                            VStack(alignment: .leading) {
//                                Text(todo.title)
//                                    .font(.headline)
//                                Text(todo.description)
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                            }
//
//                            Spacer()
//
//                            Button(role: .destructive) {
//                                todoVM.deleteTodo(todoId: todo._id, userId: session.userId)
//                            } label: {
//                                Image(systemName: "trash")
//                            }
//                        }
//                        .padding(.vertical, 4)
//                    }
//                }
//                .listStyle(.plain)
//            }
//            .padding(.horizontal)
//            .navigationTitle("Tasks")
//            .onAppear {
//                print("User ID in HomeView: \(session.userId)")
//                todoVM.fetchTodos(for: session.userId)
//            }
//
//        }
//    }
//}
//
