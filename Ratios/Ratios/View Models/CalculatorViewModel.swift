//
//  CalculatorViewModel.swift
//  Ratios
//
//  Created by John Peden on 2/29/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import Foundation

typealias Grams = Double

class CalculatorViewModel {

    var waterRatio: Grams = 16

    private init() {}

    init(waterRatio: Grams) {
        self.waterRatio = waterRatio
    }

    func calculateGramsOfWaterTimes(coffee: Grams) -> Grams {
      return waterRatio * coffee
    }
}
