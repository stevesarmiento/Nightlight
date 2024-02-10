//
//  ContentView.swift
//  Nightlight
//
//  Created by Steven Sarmiento on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progess: CGFloat = .zero
    @State private var axis: CustomSlider.SliderAxis = .vertical
    var body: some View {
        NavigationStack {
            VStack{
//                Picker("", selection: $axis) {
//                    Text("vert")
//                        .tag(CustomSlider.SliderAxis.vertical)
//                    Text("hori")
//                        .tag(CustomSlider.SliderAxis.horizontal)
//
//                }
//                .pickerStyle(.segmented)
                
                CustomSlider(
                    sliderProgress: $progess,
                    symbol: .init(
                        icon: "airpodspro",
                        tint: .gray,
                        font: .system(size: 25),
                        padding: 20
                    ),
                    axis: .vertical,
                    tint: .white
                )
                .frame(width: 120, height: 300)
                .frame(maxHeight: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .top)
            .background(.fill)
        }
    }
}

#Preview {
    ContentView()
}
