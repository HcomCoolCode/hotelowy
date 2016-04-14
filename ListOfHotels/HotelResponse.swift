//
//  HotelResponse.swift
//  ListOfHotels
//
//  Created by Michael Voong on 14/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation
import ObjectMapper

// Generated using http://parse-amol.rhcloud.com/
class HotelResponse: Mappable {
    var neighborhoods: [Neighborhood]?
    var adxReportingResult: String?
    var landmarks: [Landmark]?
    var accommodations: [Accommodation]?
    var themes: [Theme]?
    var amenities: [Amenity]?
    var hotels: [Hotel]?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        neighborhoods <- map["result.neighborhoods"]
        landmarks <- map["result.landmarks"]
        accommodations <- map["result.accommodations"]
        themes <- map["result.themes"]
        amenities <- map["result.amenities"]
        hotels <- map["result.hotels"]
    }
}