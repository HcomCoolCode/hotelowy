//
//  EANAPIKeyTests.swift
//  ListOfHotels
//
//  Created by Maciej Matyjas on 4/18/16.
//  Copyright © 2016 Expedia. All rights reserved.
//

import XCTest
@testable import ListOfHotels

class EANAPIKeyTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEANAPIKeyExists() {
        let fixed: String? = "static string for testing"
        let keys = EANAPIKeys(fileNamed: fixed)
        XCTAssertNil(keys.apiKey)
    }

    func testEANAPIKeysAcceptsFile() {
        let invalidFileName: String? = "some-file.plist"
        let keys = EANAPIKeys(fileNamed: invalidFileName);
        XCTAssertNil(keys.apiKey)
    }

    func testEANAPIKeysReadsFile() {
        let keys = EANAPIKeys(fileNamed: "MockEANAPIKeys")
        XCTAssertEqual(keys.apiKey, "IAMAPIKEY")
    }
    
    func testRealAPIKEY() {
        let keys = EANAPIKeys(fileNamed: "EANAPIKeys")
        XCTAssertNotEqual(keys.apiKey!, "IAMAPIKEY")
        XCTAssertTrue(keys.apiKey!.hasPrefix("5q"))
        XCTAssertTrue(keys.apiKey!.hasSuffix("shc"))
    }
    
    func testMD5HashOfSecret() {
        let keys = EANAPIKeys(fileNamed: "no-file-for-you")
        let sig = keys.sig(0)
        XCTAssertNotNil(sig)
    }
    
    func testSteadyMD5() {
        let keys = EANAPIKeys(fileNamed: "MockEANAPIKeys")
        let sig = keys.sig(1000)
        XCTAssertEqual(sig, "856a2b2aeb13aa79d91a82e6bffd6db1")
    }
}
