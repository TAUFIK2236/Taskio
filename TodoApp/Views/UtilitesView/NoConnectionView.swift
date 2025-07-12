import SwiftUI

struct NoConnectionView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var isRetrying = false

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "wifi.slash")
                    .font(.system(size: 64))
                    .foregroundColor(.red)

                Text("No Internet Connection")
                    .font(.title2.bold())

                Text("Please check your connection and try again.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                if isRetrying {
                    VStack(spacing: 8) {
                        ColorChangingSpinner()
                            .frame(width: 60, height: 60)
                            .padding(.top, 10)

                        Text("Retrying...")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                } else {
                    Button(action: {
                        isRetrying = true
                        networkMonitor.retryConnection {
                            isRetrying = false
                        }
                    }) {
                        Text("Retry")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .disabled(isRetrying)
                }

               
            }
            .padding()
        }
        .onAppear{networkMonitor.startAutoRetry()}
    }



}
