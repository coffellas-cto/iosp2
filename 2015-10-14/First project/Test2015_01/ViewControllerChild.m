//
//  ViewControllerChild.m
//  Test2015_01
//
//  Created by Prog on 10/14/15.
//  Copyright © 2015 KeepSolid. All rights reserved.
//

#import "ViewControllerChild.h"

@interface ViewControllerChild ()

@end

@implementation ViewControllerChild

+ (void)printSelf {
    NSLog(@"%@", self);
}

- (void)printSubviews:(UIView *)view {
    NSLog(@"%@", view);

    if (view.subviews.count > 0) {
        for (UIView *subview in view.subviews) {
            [self printSubviews:subview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self class] printSelf];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    CGRect rect = CGRectMake(0, 0, 200, 200);
    UIView *rectangleWhite = [[UIView alloc] initWithFrame:rect];
    rectangleWhite.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:rectangleWhite];
    
    UIView *rectangleRed = [UIView alloc];
    rectangleRed = [rectangleRed initWithFrame:CGRectMake(20, 20, 200, 200)];
    rectangleRed.backgroundColor = [UIColor redColor];
//    [self.view addSubview:rectangleRed];
    [rectangleWhite addSubview:rectangleRed];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:3 animations:^{
            CGRect newRect = rectangleWhite.frame;
            newRect.origin.y = 400;
            rectangleWhite.frame = newRect;
        }];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
