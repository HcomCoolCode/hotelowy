//
//  FITHotelDataSet.swift
//  ListOfHotels
//
//  Created by Richard Moult on 19/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

struct FITHotelData {
    var title:NSString
    var starRating:NSString
    var imageUrl:NSString
    var id:NSString


    static func jsonArray(array : [FITHotelData]) -> String {
        return "[" + array.map {$0.jsonRepresentation}.joinWithSeparator(",") + "]"
    }

    var jsonRepresentation : String {
        let hotelId:Int = id.integerValue
        let starRatingValue:Float = starRating.floatValue
        if id.length > 0 {
            return "{\"hotelName\":\"\(title)\",\"starRating\":\(starRatingValue),\"thumbnailUrl\":\"\(imageUrl)\",\"hotelId\":\(hotelId)}"
        }
        else {
            return "{\"hotelName\":\"\(title)\",\"starRating\":\(starRatingValue),\"thumbnailUrl\":\"\(imageUrl)\"}"
        }
    }

}



var staticHotelDataSet = [NSString: [FITHotelData]]()




@objc(FITHotelDataSet)

class FITHotelDataSet: NSObject {
    // Id to identify the hotelData in the hotelDataSet
    var staticHotelDataKey:NSString
    // Array of table rows
    var hotelDataSet = [FITHotelData]()

    // Properties
    var title:String?
    var starRating:NSString?
    var imageUrl:NSString?
    var id: NSString {
        set {
            let hotelData = FITHotelData(title: title!, starRating: starRating!, imageUrl: imageUrl!, id: newValue)
            self.hotelDataSet.append(hotelData)
        }
        get {
            return ""
        }
    }

    init(string: NSString) {
        self.staticHotelDataKey = string
        super.init()
    }

    func endTable() {
        staticHotelDataSet[self.staticHotelDataKey] = hotelDataSet
    }

    class func getStaticHotelDataSet(staticHotelDataKey: NSString) -> [FITHotelData]? {

        return staticHotelDataSet[staticHotelDataKey]
    }

}
