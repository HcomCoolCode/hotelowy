//
//  SchemaFactory.swift
//  MappingArchitecture
//
//  Created by Michael Voong on 12/04/2016.
//  Copyright © 2016 Hotels.com. All rights reserved.
//

import Foundation

protocol TransformableString {
    
}

protocol TransformableInteger {
    
}

extension String: TransformableString { }
extension Int: TransformableInteger { }

class JSONTransformer<F, T> {
    func transform<F: TransformableString, T: TransformableString>(value: F) -> T? {
        return value as? T
    }
    
    func transform<F: TransformableInteger, T: TransformableInteger>(value: F) -> T? {
        return value as? T
    }

    func transform<F: TransformableString, T: TransformableInteger>(value: F) -> T? {
        if let string = value as? String {
            return Int(string) as? T
        }
        return nil
    }
    
    func transform<F: TransformableInteger, T: TransformableString>(value: F) -> T? {
        if let integer = value as? Int {
            return String(integer) as? T
        }
        return nil
    }
}

class Schema<R: NSObject> {
    let mapping: EntityMapping<R>
    
    init(mapping: EntityMapping<R>) {
        self.mapping = mapping
    }
}