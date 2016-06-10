//
//  HotelParser.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation
import ObjectMapper

class HotelParser : HotelParsing {
    func parseHotelData(data: NSData) throws -> HotelResponse? {
        let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
        let hotelResponse = Mapper<HotelResponse>().map(json)
        return hotelResponse
    }
}