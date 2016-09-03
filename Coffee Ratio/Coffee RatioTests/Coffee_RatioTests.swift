//
//  Coffee_RatioTests.swift
//  Coffee RatioTests
//
//  Created by John Peden on 7/30/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import XCTest
//@testable import Coffee_Ratio

var vc = ViewController()

class Coffee_RatioTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    let correctValue = (16.8 * 16) as Float
    let testedValue = vc.calculateWaterInGrams(coffee: 16, water: 16.8)
    
    print("testedValue = \(testedValue)")
    
    XCTAssert(correctValue == testedValue)
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
