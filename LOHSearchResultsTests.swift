//
//  LOHSearchResultsTests.swift
//  ListOfHotels
//
//  Created by Richard Moult on 10/06/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import XCTest
@testable import ListOfHotels


struct ACHotelPODO {

    let title: String?
    let starRating: Float?
    let id: Int?
}


class FITFakeNetwork : NSObject, Network {

    var fakeDataSet: [[String:AnyObject]]

    required init(hotelDataSet: [[String:AnyObject]]) {

        fakeDataSet = hotelDataSet
        super.init()
    }

    func getURL(url: NSURL, completion: (data: NSData?, error: NSError?) -> ()) {

        let hotels = ["hotels" : fakeDataSet]
        let result = ["result" : hotels]

        if let data = try? NSJSONSerialization.dataWithJSONObject(result, options: NSJSONWritingOptions.PrettyPrinted) {

            completion(data: data, error: nil)
        }
    }
    
}



class LOHSearchResultsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_searchResults_given3ValidHotels_show3HotelsInCorrectOrder() {

        // data input
        let dataIn: [[String:AnyObject]] = [
            ["title": "hotel1", "Star rating": 1.0, "id": 1 ],
            ["title": "hotel2", "Star rating":  2.5, "id": 2 ],
            ["title": "hotel3", "Star rating": 3.0, "id": 3 ]
        ]

        // processing
        var dataOutput = processSearchResults(dataIn)

        // output
        XCTAssertEqual(dataOutput.count, 3)

        XCTAssertEqual(dataOutput[0].title, "hotel1")
        XCTAssertEqual(dataOutput[0].starRating, 1.0)
        XCTAssertEqual(dataOutput[0].id, 1)

        XCTAssertEqual(dataOutput[1].title, "hotel2")
        XCTAssertEqual(dataOutput[1].starRating, 2.5)
        XCTAssertEqual(dataOutput[1].id, 2)

        XCTAssertEqual(dataOutput[2].title, "hotel3")
        XCTAssertEqual(dataOutput[2].starRating, 3)
        XCTAssertEqual(dataOutput[2].id, 3)

    }
}



