//
//  LocationManager.m
//  WeatherForecastApp
//
//  Created by Babul  on 10/11/15.
//  Copyright (c) 2015 Babul . All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

@synthesize locationManager;
- (instancetype)init
{
    if (self = [super init])
    {
        // Initate CLLocationManager
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;

        
    }
    
    return self;
}

- (void)getCurrentLocation
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        NSUInteger code = [CLLocationManager authorizationStatus];
        
        if (code == kCLAuthorizationStatusNotDetermined){ // Check if we need to request user to give access of location services
            
            
            if ([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"])
            {
                if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
                    [self.locationManager requestAlwaysAuthorization];
            }
            
            else if ([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"])
            {
                if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
                    [self.locationManager requestWhenInUseAuthorization];
            }
            
            else
            {
                NSLog(@"info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
            }
        }
        if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            [self.locationManager requestAlwaysAuthorization];
        }
    }
    
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    
    
}

//Called when location is updated
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (newLocation != nil)
    {
        _currentLocation = newLocation;
        [self.locationManager stopUpdatingLocation];
        
        self.locationManager.delegate = nil;
        
        if ([self.delegate respondsToSelector:@selector(locationManager:didUpdateCurrentLocation:withError:)])
            [self.delegate locationManager:self didUpdateCurrentLocation:_currentLocation withError:nil];
    }
}

//Called when there is a failure in fetching location
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] != kCLErrorLocationUnknown) {
        [self stopUpdatingLocationWithMessage:NSLocalizedString(@"Error", @"Error")];
    }
        
}
- (void)stopUpdatingLocationWithMessage:(NSString *)state
{   [self.locationManager stopUpdatingLocation];
    self.locationManager.delegate = nil;
}
@end
