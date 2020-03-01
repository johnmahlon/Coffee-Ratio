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
    @State var waterRatio: String = ""


    var body: some View {
        VStack {
            
            CoffeeInput(amount: $coffee)

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

            WaterDisplay(
                waterRatio: $coffee,
                coffee: $waterRatio
            )

            Spacer()
                .frame(height: CGFloat(100))

            TimerView()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
