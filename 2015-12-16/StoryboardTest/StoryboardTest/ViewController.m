//
//  ViewController.m
//  StoryboardTest
//
//  Created by Alex on 12/16/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    [self performSegueWithIdentifier:@"presentA" sender:self];
}

- (void)gotIt:(NSNotification *)n {
    self.view.backgroundColor = n.object;
}

- (void)applicationDidBecomeActive:(NSNotification *)n {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotIt:) name:@"IamALIVE" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
