//
//  ChangeProfile.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/4/25.
//

import SwiftUI

struct ChangeProfile: View {
    @State var currentName: String
    @State var currentPassword: String
    @State private var goToProfile = false
    @State private var newPassword: String = ""

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                let w = geo.size.width
                let h = geo.size.height

                VStack(alignment: .leading, spacing: h * 0.03) {
                    Spacer().frame(height: h * 0.05)

                    Text("Change Name")
                        .font(.system(size: w * 0.07, weight: .bold))

                    Text("New Name")
                        .font(.system(size: w * 0.045))
                    TextField("", text: $currentName)
                        .padding()
                        .frame(height: h * 0.07)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(w * 0.03)
                    
                    Text("Change Password")
                        .font(.system(size: w * 0.07, weight: .bold))
                    Text("New Password")
                        .font(.system(size: w * 0.045))
                    TextField("", text: $currentPassword)
                        .padding()
                        .frame(height: h * 0.07)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(w * 0.03)

                    Spacer()

                    Button(action: {
                        goToProfile = true
                    }) {
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: w * 0.05, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: h * 0.07)
                            .background(Color.black)
                            .cornerRadius(w * 0.05)
                    }

                    // Navigation on save
                    .navigationDestination(isPresented: $goToProfile) {
                        ProfileView()
                    }
                }
                .padding(.horizontal, w * 0.06)
            }
        }
    }
}

#Preview {
    ChangeProfile(currentName: "Lo", currentPassword:"Laod")
}


