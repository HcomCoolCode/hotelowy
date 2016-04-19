//
//  EANAPINetwork.swift
//  ListOfHotels
//
//  Created by Maciej Matyjas on 4/19/16.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

let GenericError = NSError(domain: "EANAPINetwork:GenericError", code: 0, userInfo: nil)

public class EANAPINetwork : NSObject, Network {
    
    let keys: EANAPIKeys
    
    init(keys: EANAPIKeys) {
        self.keys = keys
    }
    
    func getURL(url: NSURL, completion: (data: NSData?, error: NSError?) -> ()) {
        completion(data: nil, error: GenericError);
    }

}