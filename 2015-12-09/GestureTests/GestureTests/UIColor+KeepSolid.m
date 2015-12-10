//
//  UIColor+KeepSolid.m
//  GestureTests
//
//  Created by Alex on 12/9/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "UIColor+KeepSolid.h"

@implementation UIColor (KeepSolid)

+ (UIColor *)ksgesture_randomColor {
    return [self colorWithRed:arc4random_uniform(1000) /1000.0 green:arc4random_uniform(1000) /1000.0 blue:arc4random_uniform(1000) /1000.0 alpha:1.0];
}

@end
