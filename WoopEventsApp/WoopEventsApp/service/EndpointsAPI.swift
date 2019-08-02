//
//  endpointsAPI.swift
//  WoopEventsApp
//
//  Created by Ludgero Gil Mascarenhas on 01/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import Foundation

struct EnpointsAPI {
    
    static let shared = EnpointsAPI()
    
    private static func baseUrlWith(path: String) -> URL {
        return URL(string: "https://5b840ba5db24a100142dcd8c.mockapi.io/api")!.appendingPathComponent(path)
    }
    
    func events(completion: @escaping ([EventModel]?, Error?) -> Void) {
        let resource = Resource<[EventModel]>(get: EnpointsAPI.baseUrlWith(path: "/events"))
        Networking.load(resource: resource, completion: completion)
    }
    
    func checkin(checkin: CheckInModel, completion: @escaping (CheckInResponse?,Error?) -> Void) {
        let resource = Resource<CheckInResponse>(url: EnpointsAPI.baseUrlWith(path: "/checkin"), method: .post(checkin))
        Networking.load(resource: resource, completion: completion)
    }
    
}


struct Networking {
    static func load<T>(resource: Resource<T>, completion: @escaping (T?, Error?) -> Void) {
        URLSession.shared.dataTask(with: resource.urlRequest) { (data, _, error) in
            DispatchQueue.main.async {
                if let _ = error {
                    return
                }
                let result = data.flatMap(resource.parse)
                completion(result?.0, result?.1)
            }
            }
            .resume()
    }
}
