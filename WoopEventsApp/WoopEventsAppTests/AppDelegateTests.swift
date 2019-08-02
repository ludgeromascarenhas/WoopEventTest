//
//  AppDelegateTests.swift
//  WoopEventsAppTests
//
//  Created by Ludgero Gil Mascarenhas on 02/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import XCTest
import UIKit

@testable import WoopEventsApp

class AppDelegateTests: XCTestCase {
    
    var appDelegate: AppDelegate!
    
    override func setUp() {
        super.setUp()
        appDelegate = AppDelegate()
        UIApplication.shared.delegate = appDelegate
    }
    
    override func tearDown() {
        super.tearDown()
        appDelegate = nil
        UIApplication.shared.delegate = nil
    }
    
    func testExample() {
        XCTAssertNotNil(appDelegate)
        XCTAssertTrue(appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: [:]))
    }
    
}

