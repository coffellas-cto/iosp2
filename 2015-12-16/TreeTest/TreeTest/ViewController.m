//
//  ViewController.m
//  TreeTest
//
//  Created by Alex on 12/16/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "ViewController.h"
#import "GDTree.h"
#import "GDUser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)archivingExample {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    GDUser *user;
    NSData *userData = [defaults objectForKey:@"myUser"];
    if (!userData) {
        user = [GDUser new];
        user.latitude = 124.315135;
        user.longitude = 134.47494;
        user.name = @"John Doe";
        user.ID = @19191;
        
        NSData *userData = [NSKeyedArchiver archivedDataWithRootObject:user];
        [defaults setObject:userData forKey:@"myUser"];
        [defaults synchronize];
    } else {
        user = [NSKeyedUnarchiver unarchiveObjectWithData:userData];
    }
    
    return;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *treeDic = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Basic Tree" withExtension:@"plist"]];
    GDTree *tree = [[GDTree alloc] initWithDictionary:treeDic];
    
    [tree drawTopToBottomInView:self.view point:CGPointMake(CGRectGetWidth(self.view.frame) / 2.0, 40.0)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
