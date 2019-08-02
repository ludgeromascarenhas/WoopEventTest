//
//  EventViewModel.swift
//  WoopEventsApp
//
//  Created by Ludgero Gil Mascarenhas on 01/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import Foundation

protocol EventViewModelProtocol {
    
    var eventList: [EventModel] { get }
    var currentEvent: EventModel { get set }
    func fetchEvents(completion: @escaping (Bool) -> ())
    func sendCheckin(completion: @escaping (Bool) -> ())
}

class EventViewModel: EventViewModelProtocol {
    
    init() {
        let person = PersonModel(id: "", eventId: "", name: "", picture: "")
        let cupon = CuponModel(id: "", eventId: "", discount: 0)
        privCurrentEvent = EventModel(id: "", title: "", price: 0.0, image: "", latitude: 0.0, longitude: 0.0, description: "", date: Date(), people: [person], cupons: [cupon])
    }
    
    
    private var privCurrentEvent: EventModel
    var currentEvent: EventModel {
        get {return privCurrentEvent}
        set {privCurrentEvent = newValue}
    }
    
    private var privEventList : [EventModel] = []
    var eventList: [EventModel] {
        get {return privEventList}
    }
    
    func fetchEvents(completion: @escaping (Bool) -> ()){
        EnpointsAPI.shared.events { [weak self] events, error in
            guard error == nil, events != nil else {
                completion(false)
                return
            }
            self?.privEventList = events!
            completion(true)
        }
    }
    
    func sendCheckin(completion: @escaping (Bool) -> ()) {
        
        let checkin = CheckInModel(eventId: currentEvent.id, name: "Ludgero" , email: "test@test.com")
        
        EnpointsAPI.shared.checkin(checkin: checkin) { [weak self] _, error in
            guard error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    
    
}
