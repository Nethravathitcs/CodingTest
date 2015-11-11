//
//  WeatherHandler.h
//  WeatherForecastApp
//
//  Created by Babul  on 11/11/15.
//  Copyright (c) 2015 Babul . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Weather.h"
#import "AFNetworking.h"
#import "Constant.h"

@interface WeatherHandler : NSObject

//Get weather for location dynamically based on latitude and langitude
+ (void)getWeatherForLocation:(CLLocation*)location OnSuccess:(void (^)(Weather* weather))successBlock OnFailure:(void (^)(NSError *error))failureBlock;

//Map dictionary to weather object
+ (Weather*)weatherFromDictionary:(NSDictionary*)dicWeather;


@end
