//
//  ContentView.swift
//  Ratios
//
//  Created by John Peden on 2/26/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var coffee: String = ""
    @State var waterRatio: String = UserDefaults.standard.string(forKey: "DefaultRatio") ?? ""
    @State public var defaultMeasureUnit = 0 // for picker object
    @State public var countUpOrDown = 0 // for picker object

    var body: some View {
        ZStack {
            VStack {

                CoffeeInput(amount: $coffee)
                
                Picker(selection: $defaultMeasureUnit, label: Text("Picker"), content: {
                    Text("Grams").tag(0)
                    Text("Tbsp").tag(1)
                })
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 100)

                VStack {
                    Spacer()
                        .frame(height: CGFloat(20))

                    Divider()
                        .frame(width: CGFloat(267))

                    Spacer()
                        .frame(height: CGFloat(20))
                }


                WaterInput(amount: $waterRatio)


                VStack {
                    Spacer()
                        .frame(height: CGFloat(20))

                    Divider()
                        .frame(width: CGFloat(267))

                    Spacer()
                        .frame(height: CGFloat(20))
                }
                
                // defaultMeasureUnit is used in calculateUnitOfMeasurementOfWaterTimes to determine the amount of water needed
                WaterDisplay(
                    waterRatio: $coffee,
                    coffee: $waterRatio,
                    unit: $defaultMeasureUnit
                )

                VStack {
                    Spacer()
                        .frame(height: CGFloat(20))

                    Divider()
                        .frame(width: CGFloat(267))

                    Spacer()
                        .frame(height: CGFloat(20))
                }
                Picker(selection: $countUpOrDown, label: Text(""), content: {
                    Text("Count Up").tag(0)
                    Text("Count Down").tag(1)
                })
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 300)
                
                // countUpOrDown is used to determine whether to show count up or down timer
                TimerView(timerType: $countUpOrDown)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
