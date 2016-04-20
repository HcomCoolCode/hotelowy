//
//  EANAPINetworkTests.swift
//  ListOfHotels
//
//  Created by Maciej Matyjas on 4/19/16.
//  Copyright © 2016 Expedia. All rights reserved.
//

import XCTest
@testable import ListOfHotels

class EANAPINetworkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNetworkTakesKeys() {
        let network = EANAPINetwork(keys: EANAPIKeys(fileNamed: "MockEANAPIKeys"))
        XCTAssertNotNil(network)
    }
    
    func testEANIsANetwork() {

        let expectName = "testing EAN implements Network protocol"
        let expect: XCTestExpectation = self.expectationWithDescription(expectName)

        let n: Network = EANAPINetwork(keys: EANAPIKeys(fileNamed: "MockEANAPIKeys"))
        let url = NSURL(string:"http://qz.com")
        
        n.getURL(url!, completion: {
            XCTAssertNil($0)
            XCTAssertNotNil($1)
            expect.fulfill()
        })

        self.waitForExpectationsWithTimeout(1) { error in
            XCTAssertNil(error)
        }
    }
}