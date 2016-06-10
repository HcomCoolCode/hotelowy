//
//  LOHSearchResultsTestHelper.swift
//  ListOfHotels
//
//  Created by Richard Moult on 10/06/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation
@testable import ListOfHotels

func processSearchResults(inputHotelList: [[String:AnyObject]]) -> [ACHotelPODO] {

    var output: [ACHotelPODO] = [ACHotelPODO]()

    var newDataSet = [[String:AnyObject]]()

    for hotelData in inputHotelList {

        var hotelDataSet = [String:AnyObject]()

        if let title = hotelData["title"] {
            hotelDataSet["hotelName"] = title
        }

        if let starRating = hotelData["Star rating"] {
            hotelDataSet["starRating"] = starRating
        }

        if let hotelId = hotelData["id"] {
            hotelDataSet["hotelId"] = hotelId
        }

        newDataSet.append(hotelDataSet)
    }

    // pass in new dictionary
    let fakeNetork = FITFakeNetwork( hotelDataSet: newDataSet )

    let fetcher = HotelFetcher(network: fakeNetork, parser: HotelParser())

    fetcher.fetchHotels { (hotels, error) in

        guard let validHotels = hotels else {return}

        print("got some hotels")
        for hotel in validHotels {
            output.append(ACHotelPODO(title: hotel.name, starRating: hotel.starRating, id: hotel.id))
        }

    }

    return output
}
