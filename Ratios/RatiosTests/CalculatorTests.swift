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

    let viewModel = CalculatorViewModel(waterRatio: 16)

    func testCalculation() {
        XCTAssertEqual(viewModel.calculateGramsOfWaterTimes(coffee: 20), 320.0)
    }

}
