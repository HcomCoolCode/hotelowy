//
//  Network.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation


class Network {

    func getURL(url: NSURL, completion: (data: NSData?, error: NSError?) -> ()) {
        
        guard let data = NSData(contentsOfFile: "hotels_sample.json") else {
            let error = NSError(domain: "hotels.com", code: 1, userInfo: nil)
            completion(data: nil, error: error)
            return
        }
        
        completion(data: data, error: nil)
    }
}