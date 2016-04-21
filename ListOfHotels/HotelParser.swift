//
//  HotelParser.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

class HotelParser : HotelParsing{
    func parseHotelData(data: NSData) -> [Hotel]? {
        let json: Any?
        
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
        }
        catch {
            return nil
        }
        
        
        guard let dict = json as? [String:AnyObject] else {
            return nil
        }
        
        guard let result = dict["result"] as? [String:AnyObject] else {
            return nil
        }
        
        guard let hotels = result["hotels"] as? [[String:AnyObject]] else {
            return nil
        }
        
        var parsedHotels = [Hotel]()
        
        hotels.forEach { (item) -> () in
            guard let id = item["hotelId"] as? NSNumber else {return}
            guard let name = item["hotelName"] as? String else {return}
            guard let imageURL = item["thumbnailUrl"] as? String else {return}
            guard let starRating = item["starRating"] as? NSNumber else {return}
            
            parsedHotels.append(Hotel(name: name,
                id: UInt64(id.unsignedLongValue),
                imageURL: NSURL(string: imageURL)!,
                starRating: Float(starRating.floatValue)))
        }
        
        return parsedHotels
    }
}