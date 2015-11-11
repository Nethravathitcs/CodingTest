//
//  WeatherHandler.m
//  WeatherForecastApp
//
//  Created by Babul  on 11/11/15.
//  Copyright (c) 2015 Babul . All rights reserved.
//

#import "WeatherHandler.h"

@implementation WeatherHandler

+ (void)getWeatherForLocation:(CLLocation*)location OnSuccess:(void (^)(Weather* weather))successBlock OnFailure:(void (^)(NSError *error))failureBlock
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%lf,%lf",
                                       FORECAST_API_URL,FORECAST_API_KEY,
                                       location.coordinate.latitude,
                                       location.coordinate.longitude]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (responseObject != nil && [responseObject isKindOfClass:[NSDictionary class]])
        {
            Weather *weather = [self weatherFromDictionary:responseObject];
            successBlock(weather);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failureBlock(error);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"error"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    [operation start];
}

+ (Weather*)weatherFromDictionary:(NSDictionary*)dicWeather
{
    Weather *weather = [[Weather alloc] init];
    
    if ([dicWeather valueForKey:@"currently"] != nil)
    {
        NSDictionary *dicCurrently = [dicWeather valueForKey:@"currently"];
        
        weather.temperature = [dicCurrently valueForKey:@"temperature"];
        weather.windSpeed = [dicCurrently valueForKey:@"windSpeed"];
        weather.summary = [dicCurrently valueForKey:@"summary"];
        weather.iconName = [dicCurrently valueForKey:@"icon"];
    }
    
    return weather;
}

@end
