//
//  GDNetworkController.m
//  WeatherForcast
//
//  Created by Prog on 11/18/15.
//  Copyright © 2015 KeepSolid. All rights reserved.
//

#import "GDNetworkController.h"

NSString * const kWorldWeatherOnlineKey = @"34dbaa52f5dd27d90796715c79209";

NSString * const kWorldWeatherOnlineAPIURL = @"http://api.worldweatheronline.com/free/v2/weather.ashx";

@implementation GDNetworkController

- (void)weatherForCity:(NSString *)city
          numberOfdays:(NSUInteger)numberOfdays
            completion:(void(^)(NSError *error, id responseObject))completion
{
    if (!city.length) {
        NSError *error = [NSError errorWithDomain:@"" code:-1000 userInfo:@{NSLocalizedDescriptionKey: @"No city provided"}];
        if (completion) {
            completion(error, nil);
        }
        
        return;
    }
    
    NSString *params = [[NSString alloc] initWithFormat:@"q=%@&format=json&num_of_days=%lu&key=%@&tp=24", city, (unsigned long)numberOfdays, kWorldWeatherOnlineKey];
    NSLog(@"%@", params);
    
    NSString *finalURL = [[NSString stringWithFormat:@"%@?%@", kWorldWeatherOnlineAPIURL, params] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:finalURL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (completion) {
            id responseObject = nil;
            if (!error && data) {
                responseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                if (![responseObject isKindOfClass:[NSDictionary class]]) {
                    responseObject = nil;
                    error = [NSError errorWithDomain:@"" code:-1000 userInfo:@{NSLocalizedDescriptionKey: @"Server's gone mad."}];
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(error, responseObject);
            });
        }
    }] resume];
}

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Allocate and initialize instance
        sharedInstance = [self new];
    });
    
    return sharedInstance;
}

@end
