//
//  RealNetwork.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 12/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

public class RealNetwork : NSObject, Network {

    let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    func getURL(url: NSURL, completion: (data: NSData?, error: NSError?) -> ()) {
        let task = session.dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, error: error)
        }
        task.resume()
    }
}