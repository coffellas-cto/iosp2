//
//  GDTreeNode.m
//  TreeTest
//
//  Created by Alex on 12/16/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "GDTreeNode.h"

const CGFloat kGDTreeNodeSize = 100.0;
const CGFloat kGDTreeNodePadding = 20.0;

@interface GDTreeNode ()

@property (readonly) UIView *nodeView;
@property (readonly) UILabel *nodeLabel;

@end

@implementation GDTreeNode

@synthesize nodeView = _nodeView, nodeLabel = _nodeLabel;

- (UIView *)nodeView {
    if (!_nodeView) {
        _nodeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kGDTreeNodeSize, kGDTreeNodeSize)];
        _nodeView.layer.borderWidth = 1.0;
        _nodeView.layer.borderColor = [UIColor blackColor].CGColor;
        _nodeView.layer.cornerRadius = kGDTreeNodeSize / 2.0;
        _nodeView.backgroundColor = [UIColor colorWithRed:0.3 + arc4random_uniform(255) / 255.0 green:0.3 + arc4random_uniform(255) / 255.0 blue:0.3 + arc4random_uniform(255) / 255.0 alpha:1.0];
    }
    
    return _nodeView;
}

- (UILabel *)nodeLabel {
    if (!_nodeLabel) {
        _nodeLabel = [UILabel new];
        _nodeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.nodeView addSubview:_nodeLabel];
        [self.nodeView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:nil views:@{@"label": _nodeLabel}]];
        [self.nodeView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:nil views:@{@"label": _nodeLabel}]];
        _nodeLabel.textAlignment = NSTextAlignmentCenter;
        _nodeLabel.numberOfLines = 0;
    }
    
    return _nodeLabel;
}

- (void)drawTopToBottomInView:(UIView *)view point:(CGPoint)point {
    self.nodeView.center = CGPointMake(point.x, point.y + kGDTreeNodeSize / 2.0);
    self.nodeLabel.text = self.value;
    
    NSUInteger childrenCount = self.children.count;
    CGFloat xOffset = 0.0;
    if (childrenCount > 0) {
        xOffset = - (childrenCount * (kGDTreeNodeSize + kGDTreeNodePadding) / 4.0);
    }
    
    for (GDTreeNode *subnode in self.children) {
        CGPoint newPoint = CGPointMake(point.x + xOffset, point.y + kGDTreeNodeSize + kGDTreeNodePadding);
        
        UIBezierPath *path = [UIBezierPath new];
        [path moveToPoint:CGPointMake(point.x, point.y + kGDTreeNodeSize / 2.0)];
        [path addLineToPoint:CGPointMake(newPoint.x - 1.0, newPoint.y)];
        [path addLineToPoint:CGPointMake(newPoint.x + 1.0, newPoint.y)];
        [path closePath];
        
        CAShapeLayer *pathLayer = [CAShapeLayer new];
        pathLayer.path = path.CGPath;
        pathLayer.fillColor = [UIColor blackColor].CGColor;
        [view.layer addSublayer:pathLayer];
        
        [subnode drawTopToBottomInView:view point:newPoint];
        xOffset += kGDTreeNodeSize + kGDTreeNodePadding;
    }
    
    [view addSubview:self.nodeView];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _value = dictionary[@"body"];
        NSArray *children = dictionary[@"children"];
        if (children) {
            if ([children isKindOfClass:[NSArray class]]) {
                NSMutableArray *newChildren = [NSMutableArray arrayWithCapacity:children.count];
                for (id childDic in children) {
                    if ([childDic isKindOfClass:[NSDictionary class]]) {
                        id newChild = [[GDTreeNode alloc] initWithDictionary:childDic];
                        if (newChild) {
                            [newChildren addObject:newChild];
                        } else {
                            [NSException raise:NSInternalInconsistencyException format:@"Child is nil!"];
                            return nil;
                        }
                    }
                }
                
                if (newChildren.count) {
                    _children = [newChildren copy];
                }
            } else {
                [NSException raise:NSInternalInconsistencyException format:@"Children is not an array!"];
                return nil;
            }
        }
    }
    return self;
}

@end
