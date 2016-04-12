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
        XCTAssertTrue(updateButton(app).exists)
    }
    
    func updateButton(app: XCUIApplication) -> XCUIElement {
        return app.navigationBars["ListOfHotels.MasterView"].buttons["Update"]
    }
    
    func testCollectionViewExists() {
        XCTAssertTrue(app.collectionViews.elementBoundByIndex(0).exists)
    }
    
    func testTappingUpdateLoadsCells() {
        
        updateButton(app).tap()
        updateButton(app).tap()
        
        let predicate = NSPredicate(format: "self.count > 0")
        let _ = expectationForPredicate(predicate,
                                        evaluatedWithObject: app.collectionViews.cells,
                                        handler: nil)
        waitForExpectationsWithTimeout(10, handler: nil)
        
    }
}