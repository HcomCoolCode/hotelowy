//
//  UrgencyMessage.swift
//  ListOfHotels
//
//  Created by Michael Voong on 14/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation
import ObjectMapper

// Generated using http://parse-amol.rhcloud.com/
class UrgencyMessage: Mappable {
    var roomsLeftUrgency: Int?
    var message: String?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map){
        roomsLeftUrgency <- map["roomsLeftUrgency"]
        message <- map["message"]
    }
}