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
    let starRating : NSNumber
    init(name : String, id: UInt64, imageURL: NSURL, starRating: Float) {
        self.name = name
        self.id = id
        self.imageURL = imageURL
        self.starRating = starRating
    }
}

public func ==(lhs: Hotel, rhs: Hotel) -> Bool {
    guard lhs.name == rhs.name else {return false}
    guard lhs.id == rhs.id else {return false}
    guard lhs.imageURL == rhs.imageURL else {return false}
    guard lhs.starRating == rhs.starRating else {return false}
    return true
}