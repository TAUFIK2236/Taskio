//
//  CreateTodoView.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/7/25.
//


import SwiftUI

struct CreateTodoView: View {
    let  userId: String
    @StateObject var todoViewModel = TodoViewModel()
    @EnvironmentObject var session: UserSession
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var description: String = ""

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
                    
                    
                    
                    VStack(alignment: .leading, spacing: h * 0.02) {
                        Spacer()//.frame(height: h * 0.0)
                        
                        
                        // Title
                        Text("New Task")
                            .font(.system(size: w * 0.07, weight: .bold))
                        
                        // Task Title Field
                        Text("Task Title")
                            .font(.system(size: w * 0.045))
                        TextField("", text: $title)
                            .padding()
                            .frame(height: h * 0.06)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
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
                            
                            dismiss()
                        }) {
                            Text("Add")
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
    CreateTodoView(
       
        userId: "")
}
