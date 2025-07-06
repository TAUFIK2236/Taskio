//
//  SwiftUIView.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/4/25.
//

// Regular class — each view creates its own instance
class RegularCounter {
    var count = 0

    func increase() {
        count += 1
    }
}

// Singleton class — shared instance across app
class SingletonCounter {
    static let shared = SingletonCounter()
    private init() {}

    var count = 0

    func increase() {
        count += 1
    }
}

import SwiftUI

struct CounterComparisonView: View {
    // New instance of regular class
    @State private var regularCounter = RegularCounter()
    @State private var regularCount = 0

    // Access singleton directly
    @State private var singletonCount = SingletonCounter.shared.count

    var body: some View {
        VStack(spacing: 30) {
            Text("Regular Counter: \(regularCount)")
            Button("Increase Regular") {
                regularCounter.increase()
                regularCount = regularCounter.count
            }

            Divider()

            Text("Singleton Counter: \(singletonCount)")
            Button("Increase Singleton") {
                SingletonCounter.shared.increase()
                singletonCount = SingletonCounter.shared.count
            }
        }
        .padding()
        .font(.title2)
    }
}
#Preview {
    CounterComparisonView()
}
