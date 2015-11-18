//
//  ViewController.m
//  WeatherForcast
//
//  Created by Prog on 11/18/15.
//  Copyright © 2015 KeepSolid. All rights reserved.
//

#import "ViewController.h"
#import "GDNetworkController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController {
    UILabel *_label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _label = [UILabel new];
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view insertSubview:_label belowSubview:self.activityIndicator];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-16-[label]-0-|" options:0 metrics:nil views:@{@"label": _label}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:nil views:@{@"label": _label}]];
    _label.numberOfLines = 0;
    _label.text = @"TEST";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSString *city = @"San Antonio";
    
    [self.activityIndicator startAnimating];
    
    [[GDNetworkController sharedInstance] weatherForCity:city
     numberOfdays:5 completion:^(NSError *error, id responseObject) {
         [self.activityIndicator stopAnimating];
        if (error) {
            [[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        } else {
            NSString *maxtempC;
            @try {
                maxtempC = responseObject[@"data"][@"weather"][0][@"maxtempC"];
            }
            @catch (NSException *exception) {
                
            }
            @finally {
                if (maxtempC) {
                    _label.text = [NSString stringWithFormat:@"Max. temperature in %@ is %@ °C", city, maxtempC];
                }
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
