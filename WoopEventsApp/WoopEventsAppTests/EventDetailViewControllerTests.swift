//
//  EventDetailViewControllerTests.swift
//  WoopEventsAppTests
//
//  Created by Ludgero Gil Mascarenhas on 02/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//


import XCTest
@testable import WoopEventsApp

class EventDetailViewControllerTests: XCTestCase {

    private var rootWindow: UIWindow!
    private var eventDetailViewController: EventDetailViewControllerTests!

    
    override func setUp() {
        super.setUp()
        rootWindow = UIWindow(frame: UIScreen.main.bounds)
        rootWindow.isHidden = false
        
    }
    
    override func tearDown() {
        super.tearDown()
        rootWindow.rootViewController = nil
        rootWindow.isHidden = true
        rootWindow = nil
    }
    
    
}
