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
    
    let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    init(keys: EANAPIKeys) {
        self.keys = keys
    }
    
    func getURL(url: NSURL, completion: (data: NSData?, error: NSError?) -> ()) {
        // ignoring passed in URL, in favor of our own
        let builder = EANRequestBuilder(keys: keys)
        
        if let eanUrl = builder.build() {
            let task = session.dataTaskWithURL(eanUrl) { (data, response, error) in
                completion(data: data, error: error)
            }
            task.resume()
        }
    }

}