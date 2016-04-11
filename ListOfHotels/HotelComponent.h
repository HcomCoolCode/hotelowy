//
//  HotelComponent.h
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 11/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>
@class Hotel;
@interface HotelComponent : CKCompositeComponent
+ (instancetype)newWithHotel:(Hotel *)hotel;
@end
