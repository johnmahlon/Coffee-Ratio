//
//  CalculatorViewModel.swift
//  Ratios
//
//  Created by John Peden on 2/29/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import Foundation

typealias UnitOfMeasurement = Double

class CalculatorViewModel {
    static func calculateUnitOfMeasurementOfWaterTimes(waterRatio: UnitOfMeasurement, coffee: UnitOfMeasurement, unit: Int) -> UnitOfMeasurement {
        switch unit {
        case 1:
            return waterRatio * coffee * 15
        default:
            return waterRatio * coffee
        }
    }
}
