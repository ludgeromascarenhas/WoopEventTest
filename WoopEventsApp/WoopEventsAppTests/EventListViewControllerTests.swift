//
//  EventListViewControllerTests.swift
//  WoopEventsAppTests
//
//  Created by Ludgero Gil Mascarenhas on 02/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import XCTest
@testable import WoopEventsApp

class EventListViewControllerTests: XCTestCase {
    
    private var rootWindow: UIWindow!
    private var eventListViewController: EventListViewController!
    
    override func setUp() {
        super.setUp()
        rootWindow = UIWindow(frame: UIScreen.main.bounds)
        rootWindow.isHidden = false
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        eventListViewController = storyboard.instantiateViewController(withIdentifier: "eventListViewController") as! EventListViewController
        rootWindow.rootViewController = eventListViewController
        XCTAssertNotNil(eventListViewController.view)
    }
    
    override func tearDown() {
        super.tearDown()
        eventListViewController = nil
        rootWindow.rootViewController = nil
        rootWindow.isHidden = true
        rootWindow = nil
    }
    
    func testTableView() {
        XCTAssertNotNil(eventListViewController.tableView)
        XCTAssertNotNil(eventListViewController.tableView.delegate)
        XCTAssertNotNil(eventListViewController.tableView.dataSource)
        XCTAssertTrue(eventListViewController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(eventListViewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(EventListViewController.responds(to: #selector(EventListViewController.tableView(_:cellForRowAt:))))
        XCTAssertTrue(EventListViewController.responds(to: #selector(EventListViewController.tableView(_:didSelectRowAt:))))
    }
    
    func testCell() {
        eventListViewController.tableView.reloadData()
        let indexPath = IndexPath(row: 0, section: 0)
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.5))
        let cell = eventListViewController.tableView(eventListViewController.tableView, cellForRowAt: indexPath) as? EventListCell
        let event = eventListViewController.eventViewModel?.eventList[0]
        XCTAssertEqual(cell?.title.text, event?.title)
    }
    
    func testDidSelect() {
        self.eventListViewController.tableView.delegate?.tableView?(eventListViewController.tableView, didSelectRowAt: IndexPath.init(row: 0, section: 0))
        XCTAssertTrue(self.rootWindow.rootViewController?.presentedViewController is EventDetailViewController)
    }
    
    
}
