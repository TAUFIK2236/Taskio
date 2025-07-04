//
//  RoundCheckBox.swift
//  TodoApp
//
//  Created by Anika Tabasum on 7/3/25.
//

import SwiftUI

enum CheckBoxShape {
    case circle
    case square
}

struct CustomCheckBox: View {
    @Binding var isChecked: Bool

    var size: CGFloat = 30
    var shape: CheckBoxShape = .circle
    var activeColor: Color = .green
    var inactiveColor: Color = .gray
    var checkmarkColor: Color = .green
    var iconName: String = "checkmark"

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            ZStack {
                // Shape Border
                Group {
                    if shape == .circle {
                        Circle()
                            .strokeBorder(isChecked ? activeColor : inactiveColor, lineWidth: 2)
                    } else {
                        RoundedRectangle(cornerRadius: size * 0.1)
                            .strokeBorder(isChecked ? activeColor : inactiveColor, lineWidth: 2)
                    }
                }
                .frame(width: size, height: size)

                // Checkmark Icon
                if isChecked {
                    Image(systemName: iconName)
                        .foregroundColor(checkmarkColor)
                        .font(.system(size: size * 0.6, weight: .bold))
                }
            }
        }
        .accessibilityLabel(Text(isChecked ? "Checked" : "Unchecked"))
    }
}

