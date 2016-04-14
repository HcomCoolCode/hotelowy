//
//  JSONParser.swift
//  MappingArchitecture
//
//  Created by Michael Voong on 14/04/2016.
//  Copyright © 2016 Hotels.com. All rights reserved.
//

import Foundation

class JSONParser<T: NSObject> {
    let json: AnyObject
    let mapping: EntityMappingProtocol
    
    init(json: AnyObject, mapping: EntityMappingProtocol) {
        self.json = json
        self.mapping = mapping
    }
    
    func parse() -> T {
        for setter in mapping.propertySetters {
            let value = json.valueForKeyPath(setter.0)
            print("Found value for path: \(setter.0): \(value)")
        }
        
        for keyValue in mapping.relationshipSetters {
            if let relationshipMapping = mapping.relationshipMappings[keyValue.0] {
                if let value = json.valueForKeyPath(keyValue.0) {
                    print("Found relationship value for path: \(keyValue.0): \(value)")
                    
                    let relationshipValue = JSONParser(json: value, mapping: relationshipMapping).parse()
                    print(relationshipValue)
                }
            }
        }
        
        return T()
    }
}