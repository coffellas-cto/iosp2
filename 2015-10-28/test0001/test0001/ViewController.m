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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

    table.dataSource = self.tableDelegate;
    table.delegate = self.tableDelegate;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(pushNext)];
    
    [self.view addSubview:table];
    
        [self calcHeight];

    
    return;
    
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
