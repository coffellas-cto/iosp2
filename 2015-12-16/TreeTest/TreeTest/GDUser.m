//
//  GDUser.m
//  TreeTest
//
//  Created by Alex on 12/16/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "GDUser.h"

NSString * const kGDUserKeyLatitude = @"lt";
NSString * const kGDUserKeyLongitude = @"ln";
NSString * const kGDUserKeyID = @"id";
NSString * const kGDUserKeyName = @"n";

@implementation GDUser

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:@(self.latitude) forKey:kGDUserKeyLatitude];
    [aCoder encodeObject:@(self.longitude) forKey:kGDUserKeyLongitude];
    [aCoder encodeObject:self.ID forKey:kGDUserKeyID];
    [aCoder encodeObject:self.name forKey:kGDUserKeyName];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _latitude = [[coder decodeObjectForKey:kGDUserKeyLatitude] floatValue];
        _longitude = [[coder decodeObjectForKey:kGDUserKeyLongitude] floatValue];
        _ID = [coder decodeObjectForKey:kGDUserKeyID];
        _name = [coder decodeObjectForKey:kGDUserKeyName];
    }
    return self;
}

@end
