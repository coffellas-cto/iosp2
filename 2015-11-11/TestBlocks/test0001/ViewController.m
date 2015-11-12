//
//  ViewController.m
//  test0001
//
//  Created by Prog on 10/28/15.
//  Copyright © 2015 KeepSolid. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "DebugPrinter.h"
#import "TableViewDelegate.h"
#import "TableViewDelegate2.h"


@interface ViewController ()

@property (strong) NSURLSession *session;
@end

@implementation ViewController

- (NSString *)debugInfo {
    return NSStringFromClass([self class]);
}

- (void)calcHeight {
    NSLog(@"%f", self.view.frame.size.height);
}

- (void)pushNext {
    ViewController *nextVc = [ViewController new];
    nextVc.tableDelegate = self.navigationController.viewControllers.count % 2 ? [TableViewDelegate2 new] : [TableViewDelegate new];
    [self.navigationController pushViewController:nextVc animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    __weak ViewController *weakSelf = self;
    
    NSURLSessionDataTask *task = [self.session dataTaskWithURL:[[NSURL alloc] initWithString:@"https://google.com"]
                                                             completionHandler:^(NSData * data, NSURLResponse * response, NSError * error)
                                  {
                                      NSError *finalError = error;
                                      if (!error) {
                                          if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                              NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
                                              if (HTTPResponse.statusCode >= 400 && HTTPResponse.statusCode < 600) {
                                                  finalError = [NSError errorWithDomain:@"" code:HTTPResponse.statusCode userInfo:@{NSLocalizedDescriptionKey: [NSString stringWithFormat:@"HTTP Error: %d", HTTPResponse.statusCode]}];
                                              } else {
                                                  NSString *resultString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                                                  if (!resultString) {
                                                      finalError = [NSError errorWithDomain:@"" code:-39393 userInfo:@{NSLocalizedDescriptionKey: @"Data is not ASCII encoded"}];
                                                  } else {
                                                      NSLog(@"%@", resultString);
                                                  }
                                              }
                                          } else {
                                              finalError = [NSError errorWithDomain:@"" code:-3849849 userInfo:@{NSLocalizedDescriptionKey: @"Unknown server response"}];
                                          }
                                      }
                                      
                                      NSLog(@"1");
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          NSLog(@"2");

                                          if (finalError) {
                                              [[[UIAlertView alloc] initWithTitle:@"Error" message:finalError.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
                                          } else {
                                              [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
                                                  weakSelf.view.backgroundColor = [UIColor greenColor];
                                              } completion:nil];
                                          }
                                      });
                                      
                                      NSLog(@"3");
                                  }];
    
    NSLog(@"RESUMING TASK");
    [task resume];
    
    NSLog(@"after block call");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.session = [NSURLSession sharedSession];
    
    return;
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

    table.dataSource = self.tableDelegate;
    table.delegate = self.tableDelegate;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(pushNext)];
    
    [self.view addSubview:table];
    
        [self calcHeight];

    
//    return;
    
    CFStringRef string = CFStringCreateCopy(NULL, NULL);
    CFRelease(string);
    
//    
//    
//    
//    
//
//    MyView *view = [[MyView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
//    [self.view addSubview:view];
//    
//    [DebugPrinter printPrintable:view];
//    [DebugPrinter printPrintable:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
