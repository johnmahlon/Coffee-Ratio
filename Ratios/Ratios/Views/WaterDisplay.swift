//
//  WaterDisplay.swift
//  Ratios
//
//  Created by John Peden on 2/29/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import SwiftUI

struct WaterDisplay: View {
    @Binding var waterRatio: String
    @Binding var coffee: String


    var body: some View {
        VStack {
            Text("You need")
                .fixedSize()
                .font(.system(size: 24))

            Text(
                String(describing:
                    CalculatorViewModel.calculateGramsOfWaterTimes(
                        waterRatio: Grams(string: waterRatio) ?? 0.0,
                        coffee: Grams(string: coffee) ?? 0.0
                    )
                )
            )
                .fixedSize()
                .font(.system(size: 72))


            Text("grams of water")
                .fixedSize()
                .font(.system(size: 24))
        }
    }

}
