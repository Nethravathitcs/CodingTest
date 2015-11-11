//
//  ViewController.m
//  WeatherForecastApp
//
//  Created by Babul  on 10/11/15.
//  Copyright (c) 2015 Babul . All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <LocationManagerDelegate>
{
    LocationManager *locationManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getCurrentLocation];
    
    
}

-(void)getCurrentLocation
{
    if (locationManager == nil)
        locationManager = [[LocationManager alloc] init];
    
    activity.hidden = FALSE;
    [activity startAnimating];
    
    locationManager.delegate = self;
    [locationManager getCurrentLocation];
}

//Called when location uddated or receive an error
- (void)locationManager:(LocationManager*)locationManager didUpdateCurrentLocation:(CLLocation*)location withError:(NSError*)error
{
    if (error == nil)
    {
        [WeatherHandler getWeatherForLocation:location OnSuccess:^(Weather *weather) {
            
            [activity stopAnimating];
            activity.hidden = TRUE;
            
            temperatureLabel.text = [NSString stringWithFormat:@"Temperature : %.2f°F",[weather.temperature floatValue]];
            SummaryLabel.text = [NSString stringWithFormat:@"Summary : %@",weather.summary];
            WindSpeedLbel.text = [NSString stringWithFormat:@"Wind Speed : %.2f MPH",[weather.windSpeed floatValue]];
            [self setWeatheIconForWeather:weather];
            
        } OnFailure:^(NSError *error) {
            
            [activity stopAnimating];
            activity.hidden = TRUE;
        }];
    }
    else
    {
        [activity stopAnimating];
        activity.hidden = TRUE;
    }
}

//Setting up images based on rainy,sunny and clear weather
- (void)setWeatheIconForWeather:(Weather*)weather
{
    if ([weather.iconName containsString:@"rain"])
        iconImage.image = [UIImage imageNamed:@"rainy.png"];
    
    else if ([weather.iconName containsString:@"sun"])
        iconImage.image = [UIImage imageNamed:@"sunny.png"];
    
    else if ([weather.iconName containsString:@"clear"])
        iconImage.image = [UIImage imageNamed:@"clear.png"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
