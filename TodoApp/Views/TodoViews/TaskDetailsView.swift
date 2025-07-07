//
//  TaskDetailsView.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/3/25.
//

import SwiftUI

struct TaskDetailsView: View {
    
    let todo: Todo
    @ObservedObject var todoViewModel: TodoViewModel
    @State private var checked = false
    @State private var goEditTodoView = false
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
                                    CustomCheckBox(isChecked: checked, onTap: {})
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
                        EditTodoView(title: "Etao", description:"ddd")
                    }
                    
                }
            }
        }
    }
}
//#Preview {
//    TaskDetailsView(todo)
//}

