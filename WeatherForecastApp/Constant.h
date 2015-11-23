//
//  Constant.h
//  WeatherForecastApp
//
//  Created by Babul  on 11/11/15.
//  Copyright (c) 2015 Babul . All rights reserved.
//

#ifndef WeatherForecastApp_Constant_h
#define WeatherForecastApp_Constant_h

#define IS_OS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

static NSString *const kURL = @"URL";
static NSString *const kCoordinates = @"Coordinates";
static NSString *const kApiKey = @"ApiKey";


#define FORECAST_API_KEY @"f44c78dacce0f3bda5a55f77212517ae"
#define FORECAST_API_URL @"https://api.forecast.io/forecast/"

#endif
