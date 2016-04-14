//
//  Hotel.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation
import ObjectMapper

public class Hotel : NSObject, Mappable {
    var name : String?
    var id : Int?
    var imageURL : NSURL?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name <- map["hotelName"]
        id <- map["hotelId"]
        imageURL <- (map["imageUrl"], URLTransform())
    }
}