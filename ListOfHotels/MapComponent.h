//
//  MapComponent.h
//  ListOfHotels
//
//  Created by Lawrence Forooghian on 19/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>
#import <MapKit/MapKit.h> // TODO isolate

typedef struct
{
    double latitude;
    double longitude;
} MapComponentCoordinate;

typedef struct
{
    double latitudeDelta;
    double longitudeDelta;
} MapComponentCoordinateSpan;

typedef struct
{
    MapComponentCoordinate center;
    MapComponentCoordinateSpan span;
} MapComponentCoordinateRegion;

NS_ASSUME_NONNULL_BEGIN
@interface MapComponent : CKCompositeComponent

+ (instancetype)newWithRegion:(MapComponentCoordinateRegion)region;

@end
NS_ASSUME_NONNULL_END