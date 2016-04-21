//
//  Neighbourhood.swift
//  ListOfHotels
//
//  Created by Michael Voong on 14/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation
import ObjectMapper

// Generated using http://parse-amol.rhcloud.com/
class Neighborhood: Mappable {
    var checked: Int?
    var id: Int?
    var title: String?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        checked <- map["checked"]
        id <- map["id"]
        title <- map["title"]
    }
}