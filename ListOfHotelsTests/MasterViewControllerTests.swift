//
//  MasterViewControllerTests.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import XCTest

@testable import ListOfHotels


class MasterViewControllerTests: XCTestCase {
    
    class MockFetcher : HotelFetcher {
        class MockNetwork: Network {
            override func getURL(url: NSURL, completion: (data: NSData?, error: NSError?) -> ()) {
                
            }
        }
        
        var network: MockNetwork?
        init () {
            self.network = MockNetwork()
            super.init(network: network!)
        }
        
        var fetchHotelsCalled: Bool = false
        
        var hotelsToReturn: [Hotel]?
        var errorToReturn: NSError?
        
        override func fetchHotels(completion: (hotels: [Hotel]?, error: NSError?) -> ()) {
            fetchHotelsCalled = true
            completion(hotels: hotelsToReturn, error: errorToReturn)
        }
    }
    
    var fetcher: MockFetcher!
    
    var viewController: MasterViewController!
    var navigationController: UINavigationController!
    
    override func setUp() {
        super.setUp()
        fetcher = MockFetcher()
        let stack  = createViewControllerStack(fetcher)
        viewController = stack.1
        navigationController = stack.0
        
    }
    
    override func tearDown() {
        super.tearDown()
        fetcher = nil
        viewController = nil
        navigationController = nil
    }
    
    func createViewControllerStack(fetcher: HotelFetcher) -> (UINavigationController, MasterViewController) {
        let master = MasterViewController()
        master.fetcher = fetcher
        let nc = UINavigationController(rootViewController: master)
        return (nc, master)
    }
    
    func testViewControllerExists() {
        XCTAssertNotNil(viewController)
    }
}
