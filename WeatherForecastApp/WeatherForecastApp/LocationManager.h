//
//  LocationManager.h
//  WeatherForecastApp
//
//  Created by Babul  on 10/11/15.
//  Copyright (c) 2015 Babul . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationManagerDelegate;

@interface LocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, weak) id <LocationManagerDelegate> delegate;
@property (nonatomic, strong) CLLocationManager *locationManager;

//Get current location
- (void)getCurrentLocation;

@end

@protocol LocationManagerDelegate <NSObject>

// Invoked when new location is available or error in fetching current location
- (void)locationManager:(LocationManager*)locationManager didUpdateCurrentLocation:(CLLocation*)location withError:(NSError*)error;

@end
