//
//  HotelDetailView.mm
//  ListOfHotels
//
//  Created by Lawrence Forooghian on 20/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

#import "HotelDetailView.h"
#import "MapComponent.h"
#import "ListOfHotels-Swift.h"
#import <ComponentKit/ComponentKit.h>

@interface HotelDetailView () <CKComponentProvider>

@property (nonatomic, strong) CKComponentHostingView *componentHostingView;

@end

@implementation HotelDetailView

- (instancetype)initWithFrame:(const CGRect)frame
{
    if (!(self = [super initWithFrame:frame]))
    {
        return nil;
    }
    
    _componentHostingView = [[CKComponentHostingView alloc] initWithComponentProvider:[self class] sizeRangeProvider:[CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleWidthAndHeight]];
    _componentHostingView.frame = self.bounds;
    [self addSubview:_componentHostingView];
    _componentHostingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    return self;
}

- (void)setHotelComponentModel:(HotelComponentModel *const)hotelComponentModel
{
    [self.componentHostingView updateModel:hotelComponentModel mode:CKUpdateModeSynchronous /* TODO which? */];
}

#pragma mark - CKComponentProvider

+ (CKComponent *)componentForModel:(HotelComponentModel *const)hotelComponentModel context:(const id<NSObject>)context
{
    // TODO use real hotel once data populated
    MapComponentCoordinateRegion region;
    region.center.latitude = hotelComponentModel.latitude;
    region.center.longitude = hotelComponentModel.longitude;
    region.span.latitudeDelta = 0.1;
    region.span.longitudeDelta = 0.1;
    return [MapComponent newWithRegion:region];
}

@end
