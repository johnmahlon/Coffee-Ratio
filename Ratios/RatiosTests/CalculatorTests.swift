//
//  CalculatorTests.swift
//  RatiosTests
//
//  Created by John Peden on 2/29/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import XCTest
@testable import Ratios

class CalculatorTests: XCTestCase {

    func testCalculation() {
        XCTAssertEqual(CalculatorViewModel.calculateGramsOfWaterTimes(waterRatio: 16, coffee: 20), 320.0)
    }

}
