//
//  ViewController.m
//  GestureTests
//
//  Created by Alex on 12/9/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+KeepSolid.h"
#import <MapKit/MapKit.h>

@interface ViewController () <UIGestureRecognizerDelegate> {
//    BOOL _longPressed;
}

@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation ViewController

#pragma mark - Gesture Delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    NSLog(@"%@ <=> %@", [gestureRecognizer class], [otherGestureRecognizer class]);
    if ([gestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]]) {
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    NSLog(@"%s %@ <=> %@", __PRETTY_FUNCTION__, [gestureRecognizer class], [otherGestureRecognizer class]);
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] &&
        [otherGestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint location = [gestureRecognizer locationInView:self.view];
    NSLog(@"%s %@ %@", __PRETTY_FUNCTION__, NSStringFromCGPoint(location), gestureRecognizer);

//    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
//        return NO;
//    }
    
    return YES;
}

#pragma mark - Gestures

- (void)longPressed:(UILongPressGestureRecognizer *)longPress {
    CGPoint location = [longPress locationInView:self.view];
    NSLog(@"%s %@ %@", __PRETTY_FUNCTION__, NSStringFromCGPoint(location), longPress);
    
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:
        {
            CLLocationCoordinate2D coordinates = [self.map convertPoint:location toCoordinateFromView:self.map];
            [[[UIAlertView alloc] initWithTitle:@"Location" message:[NSString stringWithFormat:@"%.4f %.4f", coordinates.latitude, coordinates.longitude] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
            break;
            
        default:
            break;
    }
}

- (void)tapped:(UITapGestureRecognizer *)tap {
    CGPoint location = [tap locationInView:self.view];
    NSLog(@"%s %@ %@", __PRETTY_FUNCTION__, NSStringFromCGPoint(location), tap);
}

- (void)panned:(UIPanGestureRecognizer *)pan {
    CGPoint translation = [pan translationInView:self.view];
    NSLog(@"translation: %@", NSStringFromCGPoint(translation));
    [self processGesture:pan changedColor:[UIColor yellowColor]];
}

- (void)pinched:(UIPinchGestureRecognizer *)pinch {
    NSLog(@"Pinch scale: %f", pinch.scale);
    [self processGesture:pinch changedColor:[UIColor purpleColor]];
}

- (void)processGesture:(UIGestureRecognizer *)g changedColor:(UIColor *)changedColor {
    CGPoint location = [g locationInView:self.view];
    NSLog(@"%s %@ %@", __PRETTY_FUNCTION__, NSStringFromCGPoint(location), g);
    switch (g.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
            self.view.backgroundColor = changedColor;
            break;
            
        default:
            self.view.backgroundColor = [UIColor whiteColor];
            break;
    }
}

- (void)swiped:(UISwipeGestureRecognizer *)swipe {
    CGPoint location = [swipe locationInView:self.view];
    NSLog(@"%s %@ %@", __PRETTY_FUNCTION__, NSStringFromCGPoint(location), swipe);
    
    switch (swipe.state) {
        case UIGestureRecognizerStateEnded:
            self.view.backgroundColor = [UIColor ksgesture_randomColor];
            break;
        default:
            break;
    }
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiped:)];
    swipe.delegate = self;
    [self.view addGestureRecognizer:swipe];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
    longPress.delegate = self;
    [self.map addGestureRecognizer:longPress];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinched:)];
    pinchGesture.delegate = self;
    [self.view addGestureRecognizer:pinchGesture];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
