//
//  HotelTests.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import XCTest
@testable import ListOfHotels

class HotelTests: XCTestCase {
    
    let imageURL = NSURL(string: "http://www.hotels.com/image.jpg")!

    func testIdIsAssigned() {
        let hotel = Hotel(name: "", id: 123, imageURL :imageURL)
        XCTAssertEqual(hotel.id, 123)
    }
    
    func testNameIsAssigned() {
        let hotel = Hotel(name: "name", id: 1, imageURL :imageURL)
        XCTAssertEqual(hotel.name, "name")
    }
    
    func testImageURLIsAssigned() {
        let hotel = Hotel(name: "name", id: 1, imageURL :imageURL)
        XCTAssertEqual(hotel.imageURL, imageURL)
    }

}
