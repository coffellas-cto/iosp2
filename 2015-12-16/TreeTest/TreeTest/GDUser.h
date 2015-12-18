//
//  GDUser.h
//  TreeTest
//
//  Created by Alex on 12/16/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDUser : NSObject <NSCoding>

@property float latitude;
@property float longitude;
@property NSNumber *ID;
@property NSString *name;

@end
