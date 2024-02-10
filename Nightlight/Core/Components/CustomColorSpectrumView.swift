//
//  CustomColorSpectrumView.swift
//  Nightlight
//
//  Created by Steven Sarmiento on 2/10/24.
//

// import SwiftUI

// struct CustomColorSpectrumView: View {
//     @Binding var selectedColor: Color
//     private let spectrumHeight: CGFloat = 20

//     var body: some View {
//         GeometryReader { geometry in
//             ZStack(alignment: .topLeading) {
//                 Rectangle()
//                     .fill(LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red]), startPoint: .leading, endPoint: .trailing))
//                     .frame(height: spectrumHeight)
//                     .cornerRadius(10)
//                     .gesture(
//                         DragGesture().onChanged { value in
//                             let x = value.location.x
//                             let width = geometry.size.width
//                             let hue = Double(x / width)
//                             selectedColor = Color(hue: hue, saturation: 1, brightness: 1)
//                         }
//                     )

//                 Circle()
//                     .fill(selectedColor)
//                     .frame(width: 30, height: 30)
//                     .offset(x: selectedColor.hue * Double(geometry.size.width) - 15, y: -5)
//                     .shadow(radius: 3)
//             }
//         }
//         .frame(height: 30)
//     }
// }
