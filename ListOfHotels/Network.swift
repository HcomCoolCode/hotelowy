//
//  Network.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//


protocol Network {
    func getURL(url: NSURL, completion: (data: NSData?, error: NSError?) -> ())
}