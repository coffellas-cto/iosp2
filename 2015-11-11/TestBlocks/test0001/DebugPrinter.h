//
//  DebugPrinter.h
//  test0001
//
//  Created by Prog on 10/28/15.
//  Copyright © 2015 KeepSolid. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DebugPrintable;

@interface DebugPrinter : NSObject

+ (void)printPrintable:(id<DebugPrintable>)printable;

@end
