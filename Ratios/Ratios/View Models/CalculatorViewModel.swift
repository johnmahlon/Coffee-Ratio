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
    static func calculateGramsOfWaterTimes(waterRatio: Grams, coffee: Grams) -> Grams {
      return waterRatio * coffee
    }
}
