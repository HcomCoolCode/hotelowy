//
//  HotelFetcher.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

func hotelsURL() -> NSURL {
    return NSURL(string: "http://www.hotels.com/hotels.json")!
}

public class HotelFetcher : NSObject {
    
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func fetchHotels(completion: (hotels: [Hotel]?, error: NSError?) -> ()) {
        network.getURL(hotelsURL()) {[unowned self] (data, error) -> () in
            self.fetchCompleted(data, error: error, completion: completion)
        }
    }
    
    func fetchCompleted(data: NSData?, error: NSError?, completion: (hotels: [Hotel]?, error: NSError?) -> ()) {
        
        guard let data = data else {
            completion(hotels: nil, error: error)
            return
        }
        let parser = HotelParser()
        
        guard let parsedHotels = parser.parseHotelData(data) else {
            let parseError = NSError(domain: "hotels.com", code: 2, userInfo: nil)
            completion(hotels: nil, error: parseError)
            return
        }
        
        completion(hotels: parsedHotels, error: nil)
    }
}