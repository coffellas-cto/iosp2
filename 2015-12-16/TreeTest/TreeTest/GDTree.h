//
//  GDTree.h
//  TreeTest
//
//  Created by Alex on 12/16/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDTreeNode.h"

@interface GDTree : NSObject

@property GDTreeNode *root;

- (void)drawTopToBottomInView:(UIView *)view point:(CGPoint)point;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
