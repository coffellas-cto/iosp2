//
//  GDTreeNode.h
//  TreeTest
//
//  Created by Alex on 12/16/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDTreeNode : NSObject

@property NSString *value;
@property NSArray *children;

- (void)drawTopToBottomInView:(UIView *)view point:(CGPoint)point;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
