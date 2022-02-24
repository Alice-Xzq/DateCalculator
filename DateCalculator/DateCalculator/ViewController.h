//
//  ViewController.h
//  DateCalculator
//
//  Created by zxiao23 on 3/30/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ViewController : NSViewController

@property (weak) IBOutlet NSDatePicker *dateInput;

@property (weak) IBOutlet NSTextField *dateDisplay;

@property (weak) IBOutlet NSTextField *resultDisplay;

@end

