
import SwiftUI

struct CustomAlertCard: View {
    let message: String
    let primaryButtonTitle: String
    let secondaryButtonTitle: String
    let primaryAction: () -> Void
    let secondaryAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("Alert")
                .font(.headline)
                .foregroundColor(.black)

            Text(message)
                .font(.subheadline)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Divider()

            VStack(spacing: 12) {
                Button(action: primaryAction) {
                    Text(primaryButtonTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                }

                Button(action: secondaryAction) {
                    Text(secondaryButtonTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.4), radius: 10, x: 3, y: 5)
        .padding(.horizontal)
        .transition(.move(edge: .top).combined(with: .opacity))
    }
}

#Preview {
    CustomAlertCard(message: "", primaryButtonTitle: "", secondaryButtonTitle: "", primaryAction:{}, secondaryAction: {})
}
