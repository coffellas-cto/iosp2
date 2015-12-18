//
//  GDTree.m
//  TreeTest
//
//  Created by Alex on 12/16/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "GDTree.h"

@implementation GDTree

- (void)drawTopToBottomInView:(UIView *)view point:(CGPoint)point {
    [view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [view.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    [_root drawTopToBottomInView:view point:point];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _root = [[GDTreeNode alloc] initWithDictionary:dictionary];
        if (!_root) {
            return nil;
        }
    }
    return self;
}

@end
