
import SwiftUI

struct CustomAlertCard: View {
    var Atitle: String
    var textColor:Color
    var message: String
    var primaryButtonTitle: String
    var secondaryButtonTitle: String
    var primaryAction: () -> Void
    var secondaryAction: () -> Void
   

    var body: some View {
        VStack(spacing: 16) {
            Text("Alert")
                .font(.headline)
                .foregroundColor(textColor)

            Text(Atitle)
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
    CustomAlertCard(Atitle:"",textColor:.accentColor,message: "", primaryButtonTitle: "", secondaryButtonTitle: "", primaryAction:{}, secondaryAction: {})
}
