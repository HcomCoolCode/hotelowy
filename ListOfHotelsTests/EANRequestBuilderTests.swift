//
//  EANRequestBuilderTests.swift
//  ListOfHotels
//
//  Created by Maciej Matyjas on 4/21/16.
//  Copyright © 2016 Expedia. All rights reserved.
//

import XCTest
@testable import ListOfHotels

class EANRequestBuilderTests: XCTestCase {

    var mockKeys = EANAPIKeys(fileNamed: "MockEANAPIKeys")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEANRequestBuilderReturnsURLs() {
        let builder = EANRequestBuilder(keys: mockKeys)
        let url = builder.build()
        XCTAssertNotNil(url)
    }

    func testEANRequestContainsCID() {
        let builder = EANRequestBuilder(keys: mockKeys)
        let url = builder.build()
        XCTAssertNotNil(url)
        XCTAssertTrue(url!.absoluteString.containsString(String(mockKeys.clientId!)))
    }
    
    func testCityQuery() {
        let builder = EANRequestBuilder(keys: mockKeys)
        builder.forCity("paris")
        let url = builder.build()
        XCTAssertTrue(url!.absoluteString.containsString("city=paris"))
    }
    
    func testShouldUseAmpersandsBetweenQueryParams() {
        let builder = EANRequestBuilder(keys: mockKeys)
        builder.forCity("paris")
        let url = builder.build()
        XCTAssertTrue(url!.absoluteString.containsString("&"))
        XCTAssertFalse(url!.absoluteString.hasSuffix("&"))
    }
}
