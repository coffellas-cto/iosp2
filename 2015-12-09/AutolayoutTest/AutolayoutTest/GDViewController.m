//
//  GDViewController.m
//  AutolayoutTest
//
//  Created by Prog on 12/2/15.
//  Copyright © 2015 KeepSolid. All rights reserved.
//

#import "GDViewController.h"
#import "MyCustomView.h"

@interface GDViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *grayViewHeightContrainy;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *grayViewAlignYConstraint;
@property (weak, nonatomic) IBOutlet MyCustomView *customViewBottom;
@property (weak, nonatomic) IBOutlet MyCustomView *customViewUpperRight;

@end

@implementation GDViewController

- (void)pulsate {
    self.grayViewHeightContrainy.constant = self.grayViewHeightContrainy.constant == 100.0 ? 200.0 : 100.0;
    self.grayViewAlignYConstraint.constant = self.grayViewAlignYConstraint.constant == 0.0 ? 120.0 : 0.0;
    
    [UIView animateWithDuration:0.5 animations:^{
            self.customViewBottom.yellowViewColor = [UIColor colorWithRed:arc4random_uniform(1000)/1000.0 green:arc4random_uniform(1000)/1000.0 blue:arc4random_uniform(1000)/1000.0 alpha:1];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self pulsate];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self pulsate];
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
