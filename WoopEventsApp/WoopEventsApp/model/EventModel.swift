//
//  EventModel.swift
//  WoopEventsApp
//
//  Created by Ludgero Gil Mascarenhas on 01/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import Foundation

struct EventModel: Codable {
    var id: String
    var title: String
    var price: Double
    var image: String
    var latitude: Double
    var longitude: Double
    var description: String
    var date: Date
    var people: [PersonModel]
    var cupons: [CuponModel]
    var imageURL: URL {
        return URL(string: image.replacingOccurrences(of: "http://", with: "https://"))!
    }
}

extension EventModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        price = try container.decode(Double.self, forKey: .price)
        image = try container.decode(String.self, forKey: .image)
        description = try container.decode(String.self, forKey: .description)
        date = try container.decode(Date.self, forKey: .date)
        people = try container.decode([PersonModel].self, forKey: .people)
        cupons = try container.decode([CuponModel].self, forKey: .cupons)
        
        if let stringValue = try? container.decode(String.self, forKey: .latitude),
            let doubleValue = Double(stringValue) {
            latitude = doubleValue
        } else {
            latitude = try container.decode(Double.self, forKey: .latitude)
        }
        if let stringValue = try? container.decode(String.self, forKey: .longitude),
            let doubleValue = Double(stringValue) {
            longitude = doubleValue
        } else {
            longitude = try container.decode(Double.self, forKey: .longitude)
        }
        
    }
}

struct PersonModel: Codable {
    var id: String
    var eventId: String
    var name: String
    var picture: String
    var pictureUrl: URL {
        return URL(string: picture.replacingOccurrences(of: "http://", with: "https://"))!
    }
}

struct CuponModel: Codable {
    var id: String
    var eventId: String
    var discount: Int
}

extension EventModel: Equatable {
    static func == (lhs: EventModel, rhs: EventModel) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.description == rhs.description
    }
}
