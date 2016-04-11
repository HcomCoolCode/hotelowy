//
//  Hotel.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

public class Hotel : NSObject{
    let name : String
    let id : UInt64
    let imageURL : NSURL
    init(name : String, id: UInt64, imageURL: NSURL) {
        self.name = name
        self.id = id
        self.imageURL = imageURL
    }
    

}

public func ==(lhs: Hotel, rhs: Hotel) -> Bool {
    guard lhs.name == rhs.name else {return false}
    guard lhs.id == rhs.id else {return false}
    guard lhs.imageURL == rhs.imageURL else {return false}
    return true
}