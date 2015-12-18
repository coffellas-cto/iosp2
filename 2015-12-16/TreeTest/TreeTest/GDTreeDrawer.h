//
//  GDTreeDrawer.h
//  TreeTest
//
//  Created by Alex on 12/16/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDTree.h"

@interface GDTreeDrawer : NSObject

- (void)drawTree:(GDTree *)tree inView:(UIView *)view atPoint:(CGPoint)point;

@end
