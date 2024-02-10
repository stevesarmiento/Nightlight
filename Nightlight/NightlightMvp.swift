//
//  NightlightMvp.swift
//  Nightlight
//
//  Created by Steven Sarmiento on 2/9/24.
//

import SwiftUI

struct NightlightMvp: View {
    @State private var screenColor: Color = .yellow // Default color
    @State private var brightness: Double = UIScreen.main.brightness // Use the current screen brightness

    var body: some View {
        VStack {
            ColorPicker("Choose Color", selection: $screenColor)
                .padding()
            Slider(value: Binding(
                get: { self.brightness },
                set: { newValue in
                    self.brightness = newValue
                    UIScreen.main.brightness = CGFloat(newValue)
                }
            ), in: 0...1, step: 0.01)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(screenColor)
        .edgesIgnoringSafeArea(.all) // Use the entire screen
    }
}

