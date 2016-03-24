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
    
    func testTappingUpdateLoadsHotelsIntoTableView() {
        
        app.navigationBars["Master"].buttons["Update"].tap()
        
        let label = app.tables.staticTexts["SLS Las Vegas a Tribute Portfolio Resort"]
        let exists = NSPredicate(format: "exists == true")

        expectationForPredicate(exists, evaluatedWithObject: label, handler: nil)
        waitForExpectationsWithTimeout(1.1, handler: nil)
        
    }
    
    func testTappingCellShowsDetails() {
        
        app.navigationBars["Master"].buttons["Update"].tap()
        
        let label = app.tables.staticTexts["SLS Las Vegas a Tribute Portfolio Resort"]
        let exists = NSPredicate(format: "exists == true")
        
        expectationForPredicate(exists, evaluatedWithObject: label, handler: nil)
        waitForExpectationsWithTimeout(1.1, handler: nil)
        
        app.tables.staticTexts["SLS Las Vegas a Tribute Portfolio Resort"].tap()
        
        let detailsLabel = app.staticTexts["SLS Las Vegas a Tribute Portfolio Resort"]
        let detailsExist = NSPredicate(format: "exists == true")
        
        expectationForPredicate(detailsExist, evaluatedWithObject: detailsLabel, handler: nil)
        waitForExpectationsWithTimeout(0.4, handler: nil)
        
    }
}