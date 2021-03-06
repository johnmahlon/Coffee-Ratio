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
    @Binding var unit: Int


    var body: some View {
        VStack {
            Text("You need")
                .fixedSize()
                .font(.system(size: 24))

            Text(
                String(
                    CalculatorViewModel.calculateUnitOfMeasurementOfWaterTimes(
                        waterRatio: UnitOfMeasurement(waterRatio) ?? 0.0,
                        coffee: UnitOfMeasurement(coffee) ?? 0.0,
                        unit: unit
                    ).rounded()
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
