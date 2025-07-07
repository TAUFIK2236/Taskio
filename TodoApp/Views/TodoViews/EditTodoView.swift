//
//  EditTodoView.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/3/25.
//

import Foundation
import SwiftUI

struct EditTodoView: View {
    @State var todoId: String
    @State var title: String
    @State var description: String
    @State var userId: String
  //  @State private var goToTodoView = false
    @StateObject var todoViewModel = TodoViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                let w = geo.size.width
                let h = geo.size.height

                VStack(){
                    Image("splashLogo") // Replace with your logo asset name
                        .resizable()
                        .scaleEffect(3)
                        .frame(width: w * 0.18,height: h * 0.06)
                    VStack(alignment: .leading, spacing: h * 0.03) {
                        Spacer().frame(height: h * 0.05)
 
                        // Title
                        Text("Edit Task")
                            .font(.system(size: w * 0.07, weight: .bold))
                        
                        // Task Title Field
                        Text("Task Title")
                            .font(.system(size: w * 0.045))
                        TextField("", text: $title)
                            .padding()
                            .frame(height: h * 0.06)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(w * 0.03)
                        
                        // Description Field
                        Text("Description")
                            .font(.system(size: w * 0.045))
                        TextEditor(text: $description)
                            .frame(height: h * 0.4)
                            .padding(6)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(w * 0.03)
                        
                        Spacer()
                        
                        // Save Button
                        
                        Button(action: {
                            //  could call an update API here if needed
                            todoViewModel.updateTodo(todoId:todoId, newTitle:title, newDescription:description, userId: userId)
                            dismiss()
                        }) {
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: w * 0.05, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: h * 0.08)
                                .background(Color.black)
                                .cornerRadius(w * 0.05)
                                .padding(5)
                        }
                        
                    }
                    .padding(.horizontal, w * 0.06)
                }
            }
        }
    }
}

#Preview {
    EditTodoView(
        todoId: "",title: "",
        description: "Buy groceries",
        userId: "Pick up milk, eggs, bread, and vegetables from the store. Don’t forget to check if we need any other items."
    )
}
