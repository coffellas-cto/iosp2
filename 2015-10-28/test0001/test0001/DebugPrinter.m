//
//  DebugPrinter.m
//  test0001
//
//  Created by Prog on 10/28/15.
//  Copyright © 2015 KeepSolid. All rights reserved.
//

#import "DebugPrinter.h"
#import "DebugPrintable.h"

@implementation DebugPrinter

+ (void)printPrintable:(id<DebugPrintable>)printable {
    NSLog(@"%@", [printable debugInfo]);
}

@end
