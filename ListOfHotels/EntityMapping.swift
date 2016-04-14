//
//  EntityMapping.swift
//  MappingArchitecture
//
//  Created by Michael Voong on 12/04/2016.
//  Copyright © 2016 Hotels.com. All rights reserved.
//

import Foundation

typealias SetterClosure = (object: AnyObject, value: AnyObject) -> Void
typealias RelationshipMappingEntry = (keyPath: String, mapping: EntityMappingProtocol, setter: SetterClosure)

protocol EntityMappingProtocol {
    var propertySetters: [String: SetterClosure] { get }
    var relationshipMappings: [RelationshipMappingEntry] { get }
}

class EntityMapping<E: NSObject> : EntityMappingProtocol {
    typealias EntityType = E
    
    private(set) var propertySetters = [String: SetterClosure]()
    private(set) var relationshipMappings = [RelationshipMappingEntry]()
    
    func withPropertyMapping<T>(fromKeyPath: String, propertySetter: (object: E, value: T) -> Void) -> Self {
        propertySetters[fromKeyPath] = { object, value in
            if let object = object as? E, value = value as? T {
                propertySetter(object: object, value: value)
            }
        }
        
        return self
    }
    
    func withRelationshipMapping<T>(fromKeyPath: String, mapping: EntityMappingProtocol, relationshipSetter: (object: E, value: T) -> Void) -> Self {
        let mapping: RelationshipMappingEntry = (keyPath: fromKeyPath, mapping: mapping, setter: { object, value in
            if let object = object as? E, value = value as? T {
                relationshipSetter(object: object, value: value)
            }
        })
        
        relationshipMappings.append(mapping)
        
        return self
    }
}