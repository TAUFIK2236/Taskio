import SwiftUI

struct CreateTodoView: View {
    @ObservedObject var viewModel: TodoViewModel
    @Environment(\.dismiss) var dismiss

    @State private var task = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Info")) {
                    TextField("Task", text: $task)
                    TextField("Description", text: $description)
                }

                Section {
                    Button("Save Task") {
                        Task {
                            await viewModel.createTodo(task: task, description: description)
                            dismiss()
                        }
                    }
                    .disabled(task.isEmpty || description.isEmpty)
                }
            }
            .navigationTitle("Create Todo")
        }
    }
}


//#Preview {
//    CreateTodoView()
//}
