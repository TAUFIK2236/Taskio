////
////  CustomCard.swift
////  TodoApp
////
////  Created by Anika Tabasum on 7/4/25.
////
//
import SwiftUI
//
//struct CustomCardButton: View {
//    let index: Int
//    let title: String
//    let description: String
//    let width: CGFloat
//    let height: CGFloat
//    let color: Color
//    var isChecked: Bool
//    let onTap: () -> Void
//
//    var body: some View {
//        Button(action: {
//            onTap()
//        }) {
//            VStack(alignment: .leading, spacing: height * 0.01) {
//                // Top: Checkmark + Index
//                HStack {
//                    CustomCheckBox(isChecked: isChecked, size: width * 0.07)
//                    Spacer()
//                    Text("#\(index + 1)")
//                        .foregroundColor(.white.opacity(0.8))
//                        .font(.system(size: width * 0.035, weight: .medium))
//                }
//
//                // Title
//                Text(title)
//                    .foregroundColor(.white)
//                    .font(.system(size: width * 0.045, weight: .bold))
//                    .lineLimit(1)
//                    .truncationMode(.tail)
//
//                // Description
//                Text(description)
//                    .foregroundColor(.white.opacity(0.9))
//                    .font(.system(size: width * 0.035))
//                    .lineLimit(2)
//                    .truncationMode(.tail)
//            }
//            .padding()
//            .frame(height: height * 0.22)
//            .frame(maxWidth: .infinity)
//            .background(color)
//            .cornerRadius(width * 0.04)
//            .shadow(color: .black.opacity(0.30), radius: 6, x: 1, y: 4)
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//}
struct CustomCardButton: View {
    let index: Int
    let title: String
    let description: String
    let width: CGFloat
    let height: CGFloat
    let color: Color
    var isChecked: Bool
    let onTap: () -> Void
    let onCheckToggle: () -> Void // ✅ new toggle action

    var body: some View {
        Button(action: {
            onTap()
        }) {
            VStack(alignment: .leading, spacing: height * 0.01) {
                HStack {
                    CustomCheckBox(isChecked: isChecked, onTap: onCheckToggle, size: width * 0.07)
                    Spacer()
                    Text("#\(index + 1)")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: width * 0.035, weight: .medium))
                }

                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: width * 0.045, weight: .bold))
                    .lineLimit(1)
                    .truncationMode(.tail)

                Text(description)
                    .foregroundColor(.white.opacity(0.9))
                    .font(.system(size: width * 0.035))
                    .lineLimit(2)
                    .truncationMode(.tail)
            }
            .padding()
            .frame(height: height * 0.22)
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(width * 0.04)
            .shadow(color: .black.opacity(0.30), radius: 6, x: 1, y: 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
