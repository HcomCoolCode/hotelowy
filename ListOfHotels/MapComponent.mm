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

@end

@implementation MapComponent

static id<MKAnnotation> _annotationForCoordinate(const MapComponentCoordinate coordinate)
{
    return [[MapComponentAnnotation alloc] initWithCoordinate:coordinate];
}

+ (instancetype)newWithRegion:(const MapComponentCoordinateRegion)region
{
    // Still don't understand what a scope is, but I need it in order to have a component controller, and I believe I need a component controller in order to be able to remove old annotations from the map when a different component is used with the view (don't know what the correct ComponentKit terminology for that is).
    CKComponentScope scope(self);
    return [super newWithComponent:
            [CKComponent
             newWithView:{
                 [MKMapView class],
                 {
                     {@selector(setRegion:), _boxedMKCoordinateRegionForRegion(region)},
                     // TODO Investigate how to avoid an accumulation of annotations.
                     // void AttributeApplicator::apply(UIView *view, const CKComponentViewConfiguration &config)
                     // http://componentkit.org/docs/views.html
                     {@selector(addAnnotation:), _annotationForCoordinate(region.center)}
                 }
             }
             size:{}]];
}

@end
