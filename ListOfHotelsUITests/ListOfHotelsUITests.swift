//
//  ListOfHotelsUITests.swift
//  ListOfHotelsUITests
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import XCTest

class ListOfHotelsUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }

    func testUpdateButtonExists() {
        XCTAssertTrue(app.navigationBars["Master"].buttons["Update"].exists)
    }
    
    func testTableViewExists() {
        XCTAssertTrue(app.tables["Empty list"].exists)
        
    }
    
}
