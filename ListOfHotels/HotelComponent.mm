//
//  HotelComponent.m
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 11/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

#import "HotelComponent.h"
#import "ListOfHotels-Swift.h"

@implementation HotelComponent
+ (instancetype)newWithHotel:(Hotel *)hotel{
    return [super newWithComponent:
            [CKInsetComponent
             newWithInsets:(UIEdgeInsets){.top = 10.0f}
             component:
             [CKLabelComponent
              newWithLabelAttributes:{
                  .string = hotel.name,
                  .color = [UIColor colorWithWhite:0.149 alpha:1.000],
                  .font =  [UIFont preferredFontForTextStyle:UIFontTextStyleTitle1],
              }
              viewAttributes:{
                  {@selector(setBackgroundColor:), [UIColor whiteColor]},
                  {@selector(setUserInteractionEnabled:), @YES},
              }
              size:{}]]];
}
@end
