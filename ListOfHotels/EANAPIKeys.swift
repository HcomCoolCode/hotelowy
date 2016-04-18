//
//  EANAPIKeys.swift
//  ListOfHotels
//
//  Created by Maciej Matyjas on 4/18/16.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

public struct EANAPIKeys {
    
    let clientId: String?
    let apiKey: String?
    let secret: String?
    
    init(fileNamed: String?) {
     
        print(fileNamed)
        print(NSBundle.mainBundle())
        let path = NSBundle.mainBundle().pathForResource(fileNamed, ofType: "plist")
        print(path)
        let keys = NSDictionary(contentsOfFile: path ?? "")
        
        clientId = keys?["CID"] as? String
        apiKey = keys?["APIKEY"] as? String
        secret = keys?["SECRET"] as? String
    }
    
    func getClientId() -> String {
        return ""
    }
}