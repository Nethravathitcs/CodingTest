//
//  ResponseTest.m
//  WeatherForecastApp
//
//  Created by Nethravathi  L on 11/23/15.
//  Copyright © 2015 Babul . All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "WeatherHandler.h"
#import "Weather.h"

@interface ResponseTest : XCTestCase

@property (nonatomic,strong) ViewController *viewControllerTest;

@end

@implementation ResponseTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.viewControllerTest = nil;
    [super tearDown];
}

//Test case for checking parserData
-(void)testParseResponse
{
    Weather *weatherModel = [ WeatherHandler weatherFromDictionary:@{@"currently":@{@"summary": @"cloudy"}}];
    XCTAssertEqual(weatherModel.summary, @"cloudy",@"pass");
}

//Test case for checking UILabel initialization
-(void)testInitializeViewAttributes
{
    [self.viewControllerTest initializeViewAttributes];
    XCTAssertNil([self.viewControllerTest SummaryLabel],@"initializeViewAttributes method is Successfully Unit Tested");
    XCTAssertNil([self.viewControllerTest temperatureLabel],@"initializeViewAttributes method is Successfully Unit Tested");
}
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
