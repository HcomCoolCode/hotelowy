//
//  EANAPIKeys.swift
//  ListOfHotels
//
//  Created by Maciej Matyjas on 4/18/16.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

public struct EANAPIKeys {
    
    let clientId: Int?
    let apiKey: String?
    private let secret: String?
    
    init(fileNamed: String?) {
     
        let path = NSBundle.mainBundle().pathForResource(fileNamed, ofType: "plist")
        let keys = NSDictionary(contentsOfFile: path ?? "")
        
        clientId = keys?["CID"] as? Int
        apiKey = keys?["APIKEY"] as? String
        secret = keys?["SECRET"] as? String
    }
    
    func sig(timestamp: UInt) -> String {

        var hash = ""
        if let ak = apiKey, s = secret where timestamp > 0 {
            let preHash = ak + s + String(timestamp)
            hash = md5(string: preHash)
        }

        return hash
    }
}

// http://stackoverflow.com/questions/32163848/how-to-convert-string-to-md5-hash-using-ios-swift
//
func md5(string string: String) -> String {
    var digest = [UInt8](count: Int(CC_MD5_DIGEST_LENGTH), repeatedValue: 0)
    if let data = string.dataUsingEncoding(NSUTF8StringEncoding) {
        CC_MD5(data.bytes, CC_LONG(data.length), &digest)
    }
    
    var digestHex = ""
    for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
        digestHex += String(format: "%02x", digest[index])
    }
    
    return digestHex
}