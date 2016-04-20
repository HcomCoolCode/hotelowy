//
//  MapComponentController.mm
//  ListOfHotels
//
//  Created by Lawrence Forooghian on 20/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

#import "MapComponentController.h"
#import <MapKit/MapKit.h>

#define MapComponentControllerLogCmd() NSLog(@"%@, self.view = %@", NSStringFromSelector(_cmd), self.view);

@implementation MapComponentController

/** The controller's component is not mounted, but is about to be. */
- (void)willMount
{
    MapComponentControllerLogCmd();
    [super willMount];
}

/** The controller's component was not previously mounted, but now it is (including all of its children). */
- (void)didMount
{
    MapComponentControllerLogCmd();
    [super didMount];
}

/**
 The controller's component is mounted and is about to be mounted again. This can happen in two scenarios:
 1. The component is updating. In that case, the controller has already received a call to -willUpdateComponent, and
 the component property already reflects the updated component that will be mounted.
 2. The root component is being attached to a different root view.
 */
- (void)willRemount
{
    MapComponentControllerLogCmd();
    [super willRemount];
}

/** The controller's component was mounted after a call to willRemount. */
- (void)didRemount
{
    MapComponentControllerLogCmd();
    [super didRemount];
}

/** The controller's component is mounted, but is about to be unmounted. */
- (void)willUnmount
{
    MapComponentControllerLogCmd();
    [super willUnmount];
}

/** The controller's component was previously mounted, but now it no longer is. */
- (void)didUnmount
{
    MapComponentControllerLogCmd();
    [super didUnmount];
}

/** If the controller's component is changing, invoked immediately before the updated component is mounted. */
- (void)willUpdateComponent
{
    MapComponentControllerLogCmd();
    [super willUpdateComponent];
}

/** If the controller's component has changed, invoked immediately after the updated component is mounted. */
- (void)didUpdateComponent
{
    MapComponentControllerLogCmd();
    [super didUpdateComponent];
}

/** Invoked immediately after the component has acquired a view. */
- (void)componentDidAcquireView
{
    MapComponentControllerLogCmd();
    [super componentDidAcquireView];
    
    if (![self.view isKindOfClass:[MKMapView class]])
    {
        [NSException raise:NSInternalInconsistencyException format:@"Expected [[%@ view] class] == MKMapView, but got %@", self, self.view.class];
    }
    
    MKMapView *const mapView = (MKMapView *)self.view;
    [mapView removeAnnotations:mapView.annotations];
}

@end
