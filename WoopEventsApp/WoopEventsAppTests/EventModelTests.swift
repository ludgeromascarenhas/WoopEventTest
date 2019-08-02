//
//  EventModelTests.swift
//  WoopEventsAppTests
//
//  Created by Ludgero Gil Mascarenhas on 02/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import XCTest
@testable import WoopEventsApp

class EventModelTests: XCTestCase {
    
    func testInit() {
        
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
        
        XCTAssertEqual(event.id, eventId)
        XCTAssertEqual(event.title, eventTitle)
        XCTAssertEqual(event.price, eventPrice)
        XCTAssertEqual(event.image, eventImage)
        XCTAssertEqual(event.latitude, eventLatitude)
        XCTAssertEqual(event.longitude, eventLongitude)
        XCTAssertEqual(event.description, eventDescription)
        XCTAssertEqual(event.date, date)
        XCTAssertEqual(event.cupons.count, eventCupons.count)
        XCTAssertEqual(event.people.count, eventPeople.count)
        
        let event1 = EventModel(id: eventId, title: eventTitle, price: eventPrice, image: eventImage, latitude: eventLatitude, longitude: eventLongitude, description: eventDescription, date: date, people: eventPeople, cupons: eventCupons)
        
        XCTAssert(event == event1)
        
    }
    
    
    
    
}
