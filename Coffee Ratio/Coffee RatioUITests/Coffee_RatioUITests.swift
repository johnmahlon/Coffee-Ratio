//
//  Coffee_RatioUITests.swift
//  Coffee RatioUITests
//
//  Created by John Peden on 7/28/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import XCTest
@testable import Coffee_Ratio

class Coffee_RatioUITests: XCTestCase {
  
  var vc = ViewController()
  
  override func setUp() {
    super.setUp()
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    vc = storyboard.instantiateInitialViewController() as! ViewController
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication().launch()
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.

  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  
  func testWaterAmount() {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCUIDevice.shared().orientation = .portrait
    XCUIDevice.shared().orientation = .portrait
    
    let app = XCUIApplication()
    let backgroundElementsQuery = app.otherElements.containing(.image, identifier:"background")
    let textField = backgroundElementsQuery.children(matching: .textField).element(boundBy: 2)
    textField.tap()
    
    let deleteKey = app.keys["Delete"]
    deleteKey.tap()
    deleteKey.tap()
    deleteKey.tap()
    deleteKey.tap()
    deleteKey.tap()
    textField.typeText("6.8")
    
    let textField2 = backgroundElementsQuery.children(matching: .textField).element(boundBy: 0)
    textField2.tap()
    textField2.typeText("16")
    app.images["background"].tap()
    
    XCTAssert(String.init(format: "%.1f", (16.8 * 16)) == vc.waterGramsLabel.text, "It Worked!")
    
  }
}
