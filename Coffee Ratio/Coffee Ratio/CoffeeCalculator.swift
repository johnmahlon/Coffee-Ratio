//
//  CoffeeCalculator.swift
//  Coffee Ratio
//
//  Created by John Peden on 8/5/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import Foundation

class CoffeeCalculator {
  
  /* Variables */
  var gramsOfWater: Double
  
  init() {
    gramsOfWater = 18.5
  }
  
  init(gramsOfWater: Double) {
    self.gramsOfWater = gramsOfWater
  }
  
  func calculateGramsOfWaterTimes(gramsOfCoffee: Int) -> Double {
    let gramsOfCoffeeAsDouble = Double(gramsOfCoffee)
    return gramsOfWater * gramsOfCoffeeAsDouble
  }
}
