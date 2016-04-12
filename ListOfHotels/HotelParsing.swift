//
//  HotelParsing.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 12/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

protocol HotelParsing {
    func parseHotelData(data: NSData) -> [Hotel]?
}