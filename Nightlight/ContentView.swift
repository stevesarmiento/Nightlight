//
//  ContentView.swift
//  Nightlight
//
//  Created by Steven Sarmiento on 2/9/24.
//

import SwiftUI

struct ContentView: View {
        @State private var screenColor: Color = .yellow
        @State private var brightness: Double = UIScreen.main.brightness
        @State private var sliderProgress: CGFloat = CGFloat(UIScreen.main.brightness)
        
    var body: some View {

        let uiColor = UIColor(screenColor)
        let adjustedColor = uiColor.adjusted(brightness: 1.3, saturation: 1)
        let adjustedSwiftUIColor = Color(adjustedColor)
        
        VStack {
            CustomSlider(
                sliderProgress: $sliderProgress,
                symbol: CustomSlider.Symbol(
                    icon: "sun.max.fill",
                    tint: .gray,
                    font: .title,
                    padding: 20
                ),
                axis: .vertical,
                tint: adjustedSwiftUIColor
            )
            .onChange(of: sliderProgress) { newValue in
                UIScreen.main.brightness = CGFloat(newValue)
            }
            .frame(width: 120, height: 300)

            // CustomColorSpectrumView(selectedColor: $screenColor)
            //     .padding()
                    
            ColorPicker("", selection: $screenColor)
                .padding()
                .frame(width: 0, height: 50)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(screenColor)
        .edgesIgnoringSafeArea(.all)
        
    }
}
    
extension UIColor {
    func adjusted(brightness: CGFloat, saturation: CGFloat) -> UIColor {
        var hue: CGFloat = 0
        var sat: CGFloat = 0
        var bright: CGFloat = 0
        var alpha: CGFloat = 0

        getHue(&hue, saturation: &sat, brightness: &bright, alpha: &alpha)
        return UIColor(hue: hue, saturation: sat * saturation, brightness: bright * brightness, alpha: alpha)
    }
}
#Preview {
    ContentView()
}
