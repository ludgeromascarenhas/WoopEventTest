//
//  EventViewModelTests.swift
//  WoopEventsAppTests
//
//  Created by Ludgero Gil Mascarenhas on 02/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import XCTest
@testable import WoopEventsApp

class EventViewModelTests: XCTestCase {
    
    private var viewModel: EventViewModel!
    
    var eventList : [EventModel] = []
    
    override func setUp() {
        super.setUp()
        viewModel = EventViewModel()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCurrentEvent() {
        let personId = "1"
        let personEventId = "1"
        let personName = "Ludgero"
        let picture = "https://teste"
        let person = PersonModel(id: personId, eventId: personEventId, name: personName, picture: picture)
        let cuponId = "1"
        let cupontEventId = "1"
        let discount = 10
        let cupon = CuponModel(id: cuponId, eventId: cupontEventId, discount: discount)
        let eventId = "1"
        let eventTitle = "Teste"
        let eventPrice = 10.0
        let eventImage = "http://test"
        let eventLatitude = -10.0
        let eventLongitude = 10.0
        let eventDescription = "teste descrip"
        let date = Date()
        let eventCupons = [cupon]
        let eventPeople = [person]
        
        let event = EventModel(id: eventId, title: eventTitle, price: eventPrice, image: eventImage, latitude: eventLatitude, longitude: eventLongitude, description: eventDescription, date: date, people: eventPeople, cupons: eventCupons)
        
        viewModel.currentEvent = event
        let currentEventCopy = viewModel.currentEvent
        XCTAssertEqual(event, currentEventCopy)
    }
    
    func testGetEvents() {
       
        let promise = expectation(description: "testGetEvents")
        EnpointsAPI.shared.events { [weak self] events, error in
            self?.eventList = events!
            promise.fulfill()
        }
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    
    
}
