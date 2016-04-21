//
//  HotelParserTests.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import XCTest
@testable import ListOfHotels



class HotelParserTests: XCTestCase {
    
    var data: NSData!
    var parser: HotelParser!
    
    override func setUp() {
        super.setUp()
        let file = NSBundle.mainBundle().pathForResource("hotels_sample", ofType: "json")
        data = NSData(contentsOfFile: file!)!
        parser = HotelParser()
    }
    
    override func tearDown() {
        super.tearDown()
        data = nil
        parser = nil
    }
    
    func testParsingEmptyDataThrowsError() {
        XCTAssertThrowsError(try parser.parseHotelData(NSData()))
    }
    
    func testParserParserHotels() {
        let response = try! parser.parseHotelData(data)!
        XCTAssertTrue(response.hotels?.count > 0)
    }
    
    func firstParsedHotel() -> Hotel? {
        let response = try! parser.parseHotelData(data)!
        return response.hotels?.first
    }
    
    func testParsingHotelAssignsHotelId() {
        let hotel = firstParsedHotel()
        XCTAssertEqual(hotel?.id, 129410)
    }
    
    func testParsingHotelAssignsHotelName() {
        let hotel = firstParsedHotel()
        XCTAssertEqual(hotel?.name, "SLS Las Vegas a Tribute Portfolio Resort")
    }
    
    func testParsingHotelAssignsHotelImageURL() {
        let hotel = firstParsedHotel()
        XCTAssertEqual(hotel?.thumbnailUrl, NSURL(string: "http://exp.cdn-hotels.com/hotels/1000000/30000/20200/20194/20194_400_t.jpg")!)
    }
    
}
