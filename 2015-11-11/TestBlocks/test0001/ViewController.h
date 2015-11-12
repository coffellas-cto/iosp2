//
//  ViewController.h
//  test0001
//
//  Created by Prog on 10/28/15.
//  Copyright © 2015 KeepSolid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DebugPrintable.h"

@interface ViewController : UIViewController <DebugPrintable> {
    @private
    NSArray *privateArray;
}


/**
 boo
 */
@property (readwrite, strong, atomic) id<UITableViewDataSource, UITableViewDelegate> tableDelegate;

- (void)calcHeight;


@end

