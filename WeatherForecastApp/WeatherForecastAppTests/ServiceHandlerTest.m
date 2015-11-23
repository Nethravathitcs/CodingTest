//
//  ServiceHandlerTest.m
//  WeatherForecastApp
//
//  Created by Nethravathi  L on 11/23/15.
//  Copyright © 2015 Babul . All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Constant.h"
#import "WeatherHandler.h"
#import "AFNetworking.h"

@interface ServiceHandlerTest : XCTestCase

@end

@implementation ServiceHandlerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

//Testcase for getNSUrlForParameters method
-(void)testUrlAndParameters
{
    NSURL *url = [WeatherHandler getNSUrlForParameters:@{kURL:FORECAST_API_URL,kApiKey:FORECAST_API_KEY,kCoordinates:@"37.785834,-122.406417"}];
    NSURL *testurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/37.785834,-122.406417",FORECAST_API_URL,FORECAST_API_KEY]];
    XCTAssertEqualObjects(url, testurl,@"Testing URL and parameters successfully UNIT TESTED");
    XCTAssertNotNil(url);
}

//Testcase for checking the URLConnection
-(void)testAsychronousConnection
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/7.785834,-122.406417",FORECAST_API_URL,FORECAST_API_KEY]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        XCTAssertNotNil(operation.responseData,@"responseObject should not be nil");
    
        if (responseObject != nil && [responseObject isKindOfClass:[NSDictionary class]])
        {
            XCTAssertEqual(operation.response.statusCode,200,@"HTTP response status code should be 200");
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        XCTAssertNil(error,"error should be nil");
        XCTFail(@"Response failed");

    }];
    
    [operation start];

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
