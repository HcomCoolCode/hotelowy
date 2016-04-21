//
//  EANRequestBuilder.swift
//  ListOfHotels
//
//  Created by Maciej Matyjas on 4/20/16.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

class EANRequestBuilder {
    
    private let keys: EANAPIKeys
    private let base = "http://api.ean.com/ean-services/rs/hotel/v3/list?"
    private var params = [String:String]()
    
    init(keys: EANAPIKeys) {
        self.keys = keys
        if let a = keys.apiKey {
            params.updateValue(a, forKey: "apiKey")
        }
        if let c = keys.clientId {
            params.updateValue(String(c), forKey: "cid")
        }
    }
    
    func forCity(city: String) -> EANRequestBuilder {
        
        params.updateValue(city, forKey: "city")
        return self
    }
    
    func build() -> NSURL? {
        var request = base
        let timestamp = NSDate().timeIntervalSince1970
        let sig = keys.sig(UInt(timestamp))
        params.updateValue(sig, forKey: "sig")
        for (key, value) in params {
            request += key + "=" + value + "&"
        }
        if(request.hasSuffix("&")) {
            request.removeAtIndex(request.characters.endIndex.predecessor())
        }
        return NSURL(string: request)
    }
}