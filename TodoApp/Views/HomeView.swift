import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = TodoViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.todos.isEmpty {
                    Text("No tasks yet.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.todos) { todo in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(todo.task)
                                        .font(.headline)
                                    Text(todo.description)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(todo.isDone ? .green : .gray)
                            }
                        }
                        .onDelete(perform: deleteTodos)
                    }
                }
            }
            .navigationTitle("My Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CreateTodoView(viewModel:viewModel)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .task {
            await viewModel.fetchTodos()
        }
    }

    private func deleteTodos(at offsets: IndexSet) {
        for index in offsets {
            let todo = viewModel.todos[index]
            Task {
                await viewModel.deleteTodo(todo.id)
                await viewModel.fetchTodos()
            }
        }
    }
}

#Preview {
    HomeView()
}

