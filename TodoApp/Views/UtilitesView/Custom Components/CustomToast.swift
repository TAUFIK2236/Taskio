


import SwiftUI

struct CustomToast: View {
    let icon: String
    let message: String
    var background: Color = Color.white
    var textColor: Color = .green
    var iconColor: Color = .green

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(iconColor)

            Text(message)
                .foregroundColor(textColor)
                .fontWeight(.semibold)
        }
        .padding()
        .background(background)
        .cornerRadius(12)
        .shadow(radius: 4)
        .padding(.horizontal)
    }
}
