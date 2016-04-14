//
//  EntityMapping.swift
//  MappingArchitecture
//
//  Created by Michael Voong on 12/04/2016.
//  Copyright © 2016 Hotels.com. All rights reserved.
//

import Foundation

public typealias SetterClosure = (object: AnyObject, value: AnyObject) -> Void

public protocol EntityMappingProtocol {
    var propertySetters: [String: SetterClosure] { get }
    var relationshipMappings: [String: EntityMappingProtocol] { get }
    var relationshipSetters: [String: SetterClosure] { get }
}

public class EntityMapping<E: NSObject> : EntityMappingProtocol {
    typealias EntityType = E
    
    public var propertySetters = [String: SetterClosure]()
    public var relationshipMappings = [String: EntityMappingProtocol]()
    public var relationshipSetters = [String: SetterClosure]()
    
    func withPropertyMapping<T>(fromKeyPath: String, propertySetter: (object: E, value: T) -> Void) -> Self {
        propertySetters[fromKeyPath] = { object, value in
            if let object = object as? E, value = value as? T {
                propertySetter(object: object, value: value)
            }
        }
        
        return self
    }
    
    func withRelationshipMapping<T>(fromKeyPath: String, mapping: EntityMappingProtocol, relationshipSetter: (object: E, value: T) -> Void) -> Self {
        relationshipMappings[fromKeyPath] = mapping
        
        return self
    }
}