//
//  MyCustomView.m
//  AutolayoutTest
//
//  Created by Alex on 12/9/15.
//  Copyright © 2015 KeepSolid. All rights reserved.
//

#import "MyCustomView.h"

@interface MyCustomView ()

@property (weak, nonatomic) IBOutlet UIView *yellowView;

@end

@implementation MyCustomView

- (UIColor *)yellowViewColor {
    return self.yellowView.backgroundColor;
}

- (void)setYellowViewColor:(UIColor *)yellowViewColor {
    self.yellowView.backgroundColor = yellowViewColor;
}

- (void)load {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    UIView *nibView = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"MyCustomView" owner:self options:nil] firstObject];
    nibView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:nibView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[nibView]-0-|" options:0 metrics:nil views:@{@"nibView": nibView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[nibView]-0-|" options:0 metrics:nil views:@{@"nibView": nibView}]];
    NSLog(@"%@", nibView);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self load];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self load];
    }
    return self;
}

@end
