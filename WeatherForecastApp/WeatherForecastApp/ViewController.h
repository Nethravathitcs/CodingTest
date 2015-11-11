//
//  ViewController.h
//  WeatherForecastApp
//
//  Created by Babul  on 10/11/15.
//  Copyright (c) 2015 Babul . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManager.h"
#import "Weather.h"
#import "WeatherHandler.h"

@interface ViewController : UIViewController
{
    IBOutlet UIImageView *iconImage;
    IBOutlet UILabel *temperatureLabel;
    IBOutlet UILabel *WindSpeedLbel;
    IBOutlet UILabel *SummaryLabel;
    
    IBOutlet UIActivityIndicatorView *activity;
}

//Setting of iconImage based on weather
- (void)setWeatheIconForWeather:(Weather*)weather;

//Get current location of user
- (void)getCurrentLocation;

@end

