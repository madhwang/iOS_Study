//
//  MapSampleViewController.m
//  MapSample
//
//  Created by Neil Smyth on 9/26/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "MapSampleViewController.h"

@interface MapSampleViewController ()

@end

@implementation MapSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self; 

    CLLocationCoordinate2D annotationCoord;

    annotationCoord.latitude = 47.640071;
    annotationCoord.longitude = -122.129598;

    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = annotationCoord;
    annotationPoint.title = @"Microsoft";
    annotationPoint.subtitle = @"Microsoft's headquarters";
    [_mapView addAnnotation:annotationPoint]; 

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zoomIn:(id)sender {
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region =
       MKCoordinateRegionMakeWithDistance (
          userLocation.location.coordinate, 50, 50);
    [_mapView setRegion:region animated:NO];
}

- (IBAction)changeMapType:(id)sender {
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else
        _mapView.mapType = MKMapTypeStandard;

}

- (void)mapView:(MKMapView *)mapView 
didUpdateUserLocation:
(MKUserLocation *)userLocation
{
    _mapView.centerCoordinate = 
          userLocation.location.coordinate;
} 

@end
