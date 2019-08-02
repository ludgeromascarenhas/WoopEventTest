//
//  CheckinModel.swift
//  WoopEventsApp
//
//  Created by Ludgero Gil Mascarenhas on 01/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import Foundation

struct CheckInModel: Codable {
    var eventId: String
    var name: String
    var email: String
}

struct CheckInResponse: Codable {
    var code: String
}
