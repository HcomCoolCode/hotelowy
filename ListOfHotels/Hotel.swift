//
//  Hotel.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

struct Hotel {
    let name : String
    let id : CLongLong
    let imageURL : NSURL
    init(name : String, id: CLongLong, imageURL: NSURL) {
        self.name = name
        self.id = id
        self.imageURL = imageURL
    }
}