//
//  RoundCheckBox.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/3/25.
//

import Foundation
import SwiftUI

struct RoundCheckBox: View {
    @Binding var isChecked: Bool
    var size: CGFloat = 30
    var activeColor: Color = .green
    var inactiveColor: Color = .black
    var checkmarkColor: Color = .green

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(isChecked ? activeColor : inactiveColor)
                    .frame(width: size, height: size)

                if isChecked {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(checkmarkColor)
                        .font(.system(size: size * 0.5, weight: .bold))
                }
            }
        }
        .accessibilityLabel(Text(isChecked ? "Checked" : "Unchecked"))
    }
}
