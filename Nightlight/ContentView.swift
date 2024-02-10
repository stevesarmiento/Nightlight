//
//  ContentView.swift
//  Nightlight
//
//  Created by Steven Sarmiento on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    
    // @State private var progess: CGFloat = .zero
    // @State private var axis: CustomSlider.SliderAxis = .vertical
        @State private var screenColor: Color = .yellow // Default color
        @State private var brightness: Double = UIScreen.main.brightness // Use the current screen brightness
        @State private var sliderProgress: CGFloat = CGFloat(UIScreen.main.brightness)

    var body: some View {

        let uiColor = UIColor(screenColor) // Convert SwiftUI Color to UIColor
        let adjustedColor = uiColor.adjusted(brightness: 1.3, saturation: 1) // Adjust brightness and saturation
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
            .frame(width: 150, height: 350)
            
            ColorPicker("", selection: $screenColor)
                .padding()
            
            // Slider(value: Binding(
            //     get: { self.brightness },
            //     set: { newValue in
            //         self.brightness = newValue
            //         UIScreen.main.brightness = CGFloat(newValue)
            //     }
            // ), in: 0...1, step: 0.01)
            // .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(screenColor)
        .edgesIgnoringSafeArea(.all)
        
    }
        // NavigationStack {
        //     VStack{
                
        //         CustomSlider(
        //             sliderProgress: $progess,
        //             symbol: .init(
        //                 icon: "airpodspro",
        //                 tint: .gray,
        //                 font: .system(size: 25),
        //                 padding: 20
        //             ),
        //             axis: .vertical,
        //             tint: .white
        //         )
        //         .frame(width: 120, height: 300)
        //         .frame(maxHeight: .infinity)
        //     }
        //     .padding()
        //     .frame(maxWidth: .infinity, alignment: .top)
        //     .background(.fill)
        // }
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
