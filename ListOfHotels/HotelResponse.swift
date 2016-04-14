//
//  HotelResponse.swift
//  ListOfHotels
//
//  Created by Michael Voong on 14/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation
import ObjectMapper

public class HotelResponse : NSObject, Mappable {
    var hotels : [Hotel]?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        hotels <- map["result.hotels"]
    }
}

