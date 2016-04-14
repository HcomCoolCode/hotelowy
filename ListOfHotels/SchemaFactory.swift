//
//  SchemaFactory.swift
//  MappingArchitecture
//
//  Created by Michael Voong on 12/04/2016.
//  Copyright © 2016 Hotels.com. All rights reserved.
//

import Foundation

protocol SchemaFactory {
    associatedtype T: NSObject
    
    func schema() -> Schema<T>
}