//
//  Weather.h
//  WeatherForecastApp
//
//  Created by Babul  on 10/11/15.
//  Copyright (c) 2015 Babul . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (strong, nonatomic) NSNumber* temperature;
@property (strong, nonatomic) NSNumber* windSpeed;
@property (strong, nonatomic) NSString* summary;
@property (strong, nonatomic) NSString* iconName; 


@end
