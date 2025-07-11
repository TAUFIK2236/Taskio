//
//  TaskDetailsView.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/3/25.
//

import SwiftUI

struct TaskDetailsView: View {
    
    
    let todo: Todo
    @EnvironmentObject var session: UserSession
    @Environment(\.dismiss) var dismiss // for the editVIew
    @ObservedObject var todoViewModel: TodoViewModel
    @State private var goEditTodoView = false
    @State private var showDeleteAlert = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                let w = geo.size.width
                let h = geo.size.height
                ZStack{
                    ScrollView{
                        VStack(spacing: h * 0.025) {
                            
                            // MARK: - Logo on Top
                            Image("splashLogo") // Replace with your logo asset name
                                .resizable()
                                .scaledToFill()
                                .frame(width: w * 0.18,height: h * 0.15)
                            
                            
                            // MARK: - Title with checkmark
                            
                            
                            // MARK: - Task Info
                            VStack(alignment: .leading, spacing: h * 0.015) {
                                HStack {
                                    Text("Task:")
                                        .font(.system(size: w * 0.09,weight:.bold))
                                        .foregroundColor(.gray)
                                    Spacer()
                                    CustomCheckBox(isChecked: todo.completed, onTap: {
                                        todoViewModel.setTodoCompletion(todoId: todo.id, completed:!todo.completed, userId:session.userId)
                                    })
                                }
                                
                                Text("\(todo.title)")
                                    .font(.system(size: w * 0.05, weight: .semibold))
                                // .foregroundColor(.gray)
                                
                                Text("Description:")
                                    .font(.system(size: w * 0.045))
                                    .padding(.top, h * 0.06)
                                    .foregroundColor(.gray)
                                
                                Text("\(todo.description)")
                                    .font(.system(size: w * 0.045))
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                
                            }
                            .padding(.horizontal, w * 0.06)
                            
                            Spacer()
                            
                            // MARK: - Delete Icon
                            Button(action: {
                                // TODO: Delete action
                                showDeleteAlert = true
                                //here add new bol button
//                                todoViewModel.deleteTodo(todoId:todo.id, userId: session.userId)
//                                dismiss()
                            }) {
                                VStack {
                                    Image(systemName: "trash")
                                        .font(.system(size: w * 0.08))
                                        .foregroundColor(.black.opacity(0.7))
                                    Text("Delete")
                                        .foregroundColor(.red.opacity(0.7))
                                }.padding(.bottom, h * 0.04)
                                
                            }
                        }
                        .frame(width: w, height: h)
                        .background(Color.white)
                        
                        
                    }
                    HStack(alignment:.lastTextBaseline){
                        Spacer()
                        FloatingButton(icon: "pencil", backgroundColor: .black) {
                            print("Add tapped")
                            goEditTodoView = true
                        }.padding(.horizontal)
                    }
                    .padding(.top,h * 0.94)
                    .navigationDestination(isPresented:$goEditTodoView) {
                        EditTodoView(todoId:todo.id, title:todo.title, description:todo.description, userId:session.userId)
                    }
                    //-------------------------
                    if showDeleteAlert {
                        ZStack {
                            Color.black.opacity(0.4).ignoresSafeArea()
                            
                            CustomAlertCard(
                                Atitle:"Delete",
                                textColor: .red,
                                message: "Are you sure?",
                                primaryButtonTitle: "Yes",
                                secondaryButtonTitle: "No",
                                primaryAction: {
                                    todoViewModel.deleteTodo(todoId: todo.id, userId: session.userId)
                                    showDeleteAlert = false
                                    dismiss()
                                },
                                secondaryAction: {
                                    showDeleteAlert = false
                                }
                            )
                            .frame(maxWidth: 300)
                            .padding()
                            .transition(.scale.combined(with: .opacity))
                            .animation(.easeInOut(duration: 0.3), value: showDeleteAlert)
                        }
                    }
                }
            }
        }
    }
}
//#Preview {
//    TaskDetailsView(todo:Todo , todoViewModel: TodoViewModel, goEditTodoView:false)
//}

