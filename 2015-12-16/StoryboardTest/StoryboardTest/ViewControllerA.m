//
//  ViewControllerA.m
//  StoryboardTest
//
//  Created by Alex on 12/16/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "ViewControllerA.h"

@interface ViewControllerA ()
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewControllerA

#pragma mark - Notifications

- (void)willResignActive:(NSNotification *)notification {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, notification);
    
    self.table.alpha = 0.5;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"IamALIVE" object:[UIColor yellowColor] userInfo:nil];

}

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor redColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"IamALIVE" object:[UIColor cyanColor] userInfo:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
