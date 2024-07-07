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
  // Constant for CGFloat
     private let spacingHeight: CGFloat = 20
     private let dividerWidth: CGFloat = 267
     private let bottomSpacerHeight: CGFloat = 100
     private let sidePadding: CGFloat = 80

    var body: some View {
        ScrollView {
            VStack {
                
                CoffeeInput(amount: $coffee)

                VStack {
                    Spacer()
                        .frame(height:spacingHeight)

                    Divider()
                        .frame(width:dividerWidth)

                    Spacer()
                        .frame(height:spacingHeight)
                }


                WaterInput(amount: $waterRatio)

                VStack {
                    Spacer()
                        .frame(height:spacingHeight)

                    Divider()
                        .frame(width: dividerWidth)

                    Spacer()
                        .frame(height:spacingHeight)
                }

                WaterDisplay(
                    waterRatio: $coffee,
                    coffee: $waterRatio
                )

                Spacer()
                    .frame(height:bottomSpacerHeight)

                TimerView()

            }.padding(sidePadding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
