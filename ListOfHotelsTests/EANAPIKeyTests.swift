//
//  EANAPIKeyTests.swift
//  ListOfHotels
//
//  Created by Maciej Matyjas on 4/18/16.
//  Copyright © 2016 Expedia. All rights reserved.
//

import XCTest

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
        let keys = EANAPIKeys(fileNamed: "")
        let clientID = keys.getClientId();
        XCTAssertNotNil(clientID);
    }

    func testEANAPIKeysAcceptsFile() {
        let keys = EANAPIKeys(fileNamed: "some-file.plist");
        XCTAssertNotNil(keys.getClientId())
    }

    func testEANAPIKeysReadsFile() {
        let keys = EANAPIKeys(fileNamed: "MockEANAPIKeys")
        XCTAssertEqual(keys.secret, "IAMSECRET")
    }
}
