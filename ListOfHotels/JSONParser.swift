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
        let object = T()
        
        for setter in mapping.propertySetters {
            let value = json.valueForKeyPath(setter.0)
            print("Found value for path: \(setter.0): \(value)")
        }
        
        for relationship in mapping.relationshipMappings {
            if let value = json.valueForKeyPath(relationship.keyPath) {
                print("Found relationship value for path: \(relationship.keyPath): \(value)")
                
                let relationshipValue = JSONParser(json: value, mapping: relationship.mapping).parse()
                relationship.setter(object: object, value: relationshipValue)
                print(relationshipValue)
            }
        }
        
        return object
    }
}