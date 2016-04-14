//
//  MappingArchitectureTests.swift
//  MappingArchitectureTests
//
//  Created by Michael Voong on 12/04/2016.
//  Copyright © 2016 Hotels.com. All rights reserved.
//

import XCTest

class MappingArchitectureTests: XCTestCase {
    func test() {
        let schema = ImagesSchemaFactory().schema()
        let result = JSONParser(json: [
                "hotel_id": 20,
                "hotel_images": [
                    "base_url": "http://",
                    "sizes": []
                ]
            ], mapping: schema.mapping).parse()
        
        print(result)
    }
}
