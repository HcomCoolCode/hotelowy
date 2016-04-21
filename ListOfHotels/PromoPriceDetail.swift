//
//  PromoPriceDetail.swift
//  ListOfHotels
//
//  Created by Michael Voong on 14/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation
import ObjectMapper

// Generated using http://parse-amol.rhcloud.com/
class PromoPriceDetail: Mappable {
    var postfix: String?
    var formattedValue: String?
    var prefix: String?
    var value: String?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        postfix <- map["postfix"]
        formattedValue <- map["formattedValue"]
        prefix <- map["prefix"]
        value <- map["value"]
    }
}