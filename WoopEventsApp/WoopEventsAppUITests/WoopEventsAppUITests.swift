//
//  WoopEventsAppUITests.swift
//  WoopEventsAppUITests
//
//  Created by Ludgero Gil Mascarenhas on 01/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import XCTest
@testable import WoopEventsApp

class WoopEventsAppUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCUIApplication().tables.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.tap()
    }

}
