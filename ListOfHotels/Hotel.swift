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
    var inExpandedArea: Int?
    var guestReviewRating: Float?
    var numberOfGuestReviews: Int?
    var avgPrice: String?
    var urgencyMessage: UrgencyMessage?
    var avgPriceDetails: AveragePriceDetail?
    var localizedCountryName: String?
    var thumbnailUrl: NSURL?
    var promoPrice: String?
    var locality: String?
    var lon: Float?
    var starRating: Float?
    var avgPriceDescription: String?
    var location: String?
    var postalCode: String?
    var id: Int?
    var address1: String?
    var address2: String?
    var promoPriceDescription: String?
    var promoPriceDetails: PromoPriceDetail?
    var qualitativeBadgeText: String?
    var lat: Float?
    var countryAlpha3Code: String?
    var country: String?
    var imageURL: NSURL?
    var name: String?
    var dealOfTheDay: Int?
    var region: String?
    
    public required init?(_ map: Map) {
    }
    
    public func mapping(map: Map) {
        inExpandedArea <- map["inExpandedArea"]
        guestReviewRating <- map["guestReviewRating"]
        numberOfGuestReviews <- map["numberOfGuestReviews"]
        avgPrice <- map["avgPrice"]
        urgencyMessage <- map["urgencyMessage"]
        avgPriceDetails <- map["avgPriceDetails"]
        localizedCountryName <- map["localizedCountryName"]
        thumbnailUrl <- (map["thumbnailUrl"], URLTransform())
        promoPrice <- map["promoPrice"]
        locality <- map["locality"]
        lon <- map["lon"]
        starRating <- map["starRating"]
        avgPriceDescription <- map["avgPriceDescription"]
        location <- map["location"]
        postalCode <- map["postalCode"]
        id <- map["hotelId"]
        address1 <- map["address1"]
        address2 <- map["address2"]
        promoPriceDescription <- map["promoPriceDescription"]
        promoPriceDetails <- map["promoPriceDetails"]
        qualitativeBadgeText <- map["qualitativeBadgeText"]
        lat <- map["lat"]
        countryAlpha3Code <- map["countryAlpha3Code"]
        country <- map["country"]
        imageURL <- (map["imageUrl"], URLTransform())
        name <- map["hotelName"]
        dealOfTheDay <- map["dealOfTheDay"]
        region <- map["region"]
    }
}

public func ==(lhs: Hotel, rhs: Hotel) -> Bool {
    guard lhs.name == rhs.name else {return false}
    guard lhs.id == rhs.id else {return false}
    guard lhs.imageURL == rhs.imageURL else {return false}
    return true
}