//
//  HotelComponent.m
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 11/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

#import "HotelComponent.h"
#import "ListOfHotels-Swift.h"

/*
 Intro article about ComponentKit:
 https://www.objc.io/issues/22-scale/facebook/
 
 The documentation about how to create components can be found here :
 http://componentkit.org/docs/getting-started.html
 
 A bigger sample app written using ComponentKit is available here:
 https://github.com/MarcoSero/HackerNews
 
 A simple SRP implementation can be viewed here: 
 https://stash.hcom/projects/IOS/repos/universalhotels/browse/HotelSearch/hotelsearch?at=refs%2Fheads%2FCS%2FBudapest-Hackathon-FastSRP
 */

@interface HotelComponent ()
@property (nonatomic, strong) Hotel *hotel;
@end

@implementation HotelComponent
+ (instancetype)newWithHotel:(Hotel *)hotel{
    HotelComponent *component =
    [super newWithComponent:
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
           {CKComponentTapGestureAttribute(@selector(didTapView))}
       }
       size:{}]]];
    component.hotel = hotel;
    return component;
}

- (void)didTapView{
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *delegate = (AppDelegate *)app.delegate;
    [delegate showHotelDetails:self.hotel];
}
@end
