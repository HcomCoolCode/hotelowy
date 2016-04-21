//
//  MapComponent.mm
//  ListOfHotels
//
//  Created by Lawrence Forooghian on 19/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

#import "MapComponent.h"
#import <MapKit/MapKit.h>

static CLLocationCoordinate2D _MapKitCoordinateForCoordinate(const MapComponentCoordinate coordinate)
{
    CLLocationCoordinate2D mkCoordinate;
    mkCoordinate.latitude = coordinate.latitude;
    mkCoordinate.longitude = coordinate.longitude;
    return mkCoordinate;
}

static NSValue *_boxedMKCoordinateRegionForRegion(const MapComponentCoordinateRegion region)
{
    MKCoordinateRegion mkRegion;
    mkRegion.center = _MapKitCoordinateForCoordinate(region.center);
    mkRegion.span.latitudeDelta = region.span.latitudeDelta;
    mkRegion.span.longitudeDelta = region.span.longitudeDelta;
    
    return [NSValue valueWithBytes:&mkRegion objCType:@encode(__typeof(mkRegion))];
}

@interface MapComponentAnnotation : NSObject <MKAnnotation>

- (instancetype)initWithCoordinate:(MapComponentCoordinate)coordinate;

@end

@implementation MapComponentAnnotation

@synthesize coordinate = _coordinate;

- (instancetype)initWithCoordinate:(const MapComponentCoordinate)coordinate
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    _coordinate = _MapKitCoordinateForCoordinate(coordinate);
    
    return self;
}

- (NSUInteger)hash
{
    return (NSUInteger)(self.coordinate.latitude + self.coordinate.longitude);
}

- (BOOL)isEqual:(const id)object
{
    if (![object isKindOfClass:[MapComponentAnnotation class]])
    {
        return NO;
    }
    
    MapComponentAnnotation *const otherAnnotation = object;
    return    otherAnnotation.coordinate.latitude == self.coordinate.latitude
           && otherAnnotation.coordinate.longitude == self.coordinate.longitude;
}

@end

@implementation MapComponent

static id<MKAnnotation> _annotationForCoordinate(const MapComponentCoordinate coordinate)
{
    return [[MapComponentAnnotation alloc] initWithCoordinate:coordinate];
}

+ (instancetype)newWithRegion:(const MapComponentCoordinateRegion)region
{
    return [super newWithComponent:
            [CKComponent
             newWithView:{
                 [MKMapView class],
                 {
                     {@selector(setRegion:), _boxedMKCoordinateRegionForRegion(region)},

                     {
                         {
                             "MapComponentAnnotations",
                             // See CKComponentViewAttribute docs: we are providing a custom `applicator`
                             // to manipulate the map view's annotations, since its `annotation` property
                             // is readonly.
                             ^(MKMapView *const view, const id<MKAnnotation> annotation)
                             {
                                 [view removeAnnotations:view.annotations];
                                 [view addAnnotation:annotation];
                             }
                         },
                         _annotationForCoordinate(region.center)
                     }
                 }
             }
             size:{}]];
}

@end
