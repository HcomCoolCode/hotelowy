//
//  HotelFetcherTests.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import XCTest
@testable import ListOfHotels

class HotelFetcherTests: XCTestCase {
    
    class MockNetwork: Network {

        var getURLcalled: Bool = false
        var passedURL: NSURL?
        var passedCompletion: ((data: NSData?, error: NSError?) -> ())?
        override func getURL(url: NSURL, completion: (data: NSData?, error: NSError?) -> ()) {
            getURLcalled = true
            passedURL = url
            passedCompletion = completion
        }
    }
    
    var network : MockNetwork!
    var fetcher : HotelFetcher!
    
    override func setUp() {
        super.setUp()
        network = MockNetwork()
        fetcher = HotelFetcher(network: network)
    }
    
    override func tearDown() {
        super.tearDown()
        fetcher = nil
        network = nil
    }
    
    func testHotelFetchCallsGetURLOnNetwork() {
        fetcher.fetchHotels { (hotels, error) -> () in}
        XCTAssertTrue(network.getURLcalled)
    }

    func testHotelFetchPassesURLToNetwork() {
        fetcher.fetchHotels { (hotels, error) -> () in}
        XCTAssertNotNil(network.passedURL)
    }
    
    func testHotelFetchPassesCompletion() {
        fetcher.fetchHotels { (hotels, error) -> () in}
        XCTAssertNotNil(network.passedCompletion)
    }

}
