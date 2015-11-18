//
//  GDNetworkController.h
//  WeatherForcast
//
//  Created by Prog on 11/18/15.
//  Copyright © 2015 KeepSolid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDNetworkController : NSObject

- (void)weatherForCity:(NSString *)city numberOfdays:(NSUInteger)numberOfdays completion:(void(^)(NSError *error, id responseObject))completion;

+ (instancetype)sharedInstance;

@end
