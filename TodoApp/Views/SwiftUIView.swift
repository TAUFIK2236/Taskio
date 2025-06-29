//
//  SwiftUIView.swift
//  TodoApp
//
//  Created by Anika Tabasum on 6/28/25.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var showDrawer = false

    var body: some View {
        ZStack {
            NavigationView {
                ZStack(alignment: .topLeading) {
                    VStack(alignment: .leading, spacing: 16) {
                        // AppBar
                        HStack {
                            Button(action: {
                                withAnimation {
                                    showDrawer.toggle()
                                }
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .font(.title2)
                                    .foregroundColor(.black)
                            }

                            Spacer()

                            Image("splashLogo") // make sure this is in Assets
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)

                            Spacer()

                            Image(systemName: "calendar")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal)

                        // Profile + Greeting
                        HStack(spacing: 16) {
                            Image("ProfilePic") // Add to Assets or use .systemName
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Hi Syed!")
                                    .font(.title2)
                                    .bold()
                                Text("Good morning!\nYou have 5 task for today.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)

                        // Date
                        Text("Sunday - 18 March, 2018")
                            .font(.headline)
                            .padding(.horizontal)

                        // Task Grid
                        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16) {
                            taskCard(title: "All Task", count: 4, color: .blue)
                            taskCard(title: "Personal", count: 2, color: .orange)
                            taskCard(title: "Work", count: 2, color: .cyan)
                            addTaskCard()
                        }
                        .padding(.horizontal)

                        Spacer()
                    }
                    .padding(.top, 20)
                    .navigationBarHidden(true)

                    // Drawer Menu
                    if showDrawer {
                        DrawerView()
                            .frame(width: 240)
                            .transition(.move(edge: .leading))
                    }
                }
            }
        }
    }

    // Task Card View
    func taskCard(title: String, count: Int, color: Color) -> some View {
        VStack {
            Text("\(count) Task")
                .font(.caption)
                .foregroundColor(.white)
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(color)
        .cornerRadius(16)
    }

    // Add Task Card View
    func addTaskCard() -> some View {
        VStack {
            Image(systemName: "plus")
                .font(.title)
                .foregroundColor(.gray)
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
}

// Dummy Drawer View
struct DrawerView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Menu")
                .font(.title2)
                .bold()
                .padding(.top, 60)
            Text("Home")
            Text("Settings")
            Text("Log out")
            Spacer()
        }
        .padding()
        .background(Color.white.shadow(radius: 10))
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    SwiftUIView()
}
