//
//  ViewController.h
//  test0001
//
//  Created by Prog on 10/28/15.
//  Copyright © 2015 KeepSolid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DebugPrintable.h"

@interface ViewController : UIViewController <DebugPrintable>


@property id<UITableViewDataSource, UITableViewDelegate> tableDelegate;

- (void)calcHeight;


@end

