//
//  ViewController.m
//  DateCalculator
//
//  Created by zxiao23 on 3/30/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import "ViewController.h"
#import "Date.h"

@implementation ViewController

Date * myDate;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

//pre: the user had entered a date into the date picker
//post: translated the date that was given into a Date object and display that date in the formate of mm/dd/yyyy on the display
- (IBAction)getDate:(id)sender {
    NSDate *inputDate = [self.dateInput dateValue];
    myDate = [[Date alloc] initWithNSDate : inputDate];
    [self.dateDisplay setStringValue: [myDate toString]];
}

//pre: the user had entered a date
//post: calculates when is next week from the current date and set and display it as the current date
- (IBAction)nextWeekPushed:(id)sender {
    if(myDate){
        myDate = [myDate nextWeek];
        [self.dateDisplay setStringValue:[NSString stringWithFormat:@"%d / %d / %d", [myDate month], [myDate day], [myDate year]]];
        [self.resultDisplay setStringValue:@""];
        self.resultDisplay.textColor = NSColor.textColor;
    }else{
        [self.resultDisplay setStringValue:@"Please enter a date before you perform this action :)"];
        self.resultDisplay.textColor = NSColor.redColor;
    }
}

//pre: the user had entered a date
//post: calculates when is last week from the current date and set and display it as the current date
- (IBAction)lastWeekPushed:(id)sender {
    if(myDate){
        myDate = [myDate lastWeek];
        [self.dateDisplay setStringValue:[NSString stringWithFormat:@"%d / %d / %d", [myDate month], [myDate day], [myDate year]]];
        [self.resultDisplay setStringValue:@""];
        self.resultDisplay.textColor = NSColor.textColor;
    }else{
        [self.resultDisplay setStringValue:@"Please enter a date before you perform this action :)"];
        self.resultDisplay.textColor = NSColor.redColor;
    }
}

//pre: user entered a date and selected a new date in the date picker
//post: print out whether the new selected day is before or after 
- (IBAction)isBeforePushed:(id)sender {
    NSDate *inputDate = [self.dateInput dateValue];
    Date *newDate = [[Date alloc] initWithNSDate : inputDate];
    [self.dateDisplay setStringValue: [myDate toString]];
    bool before = [myDate isBefore:newDate];
    if([myDate isEqual:newDate]){
        [self.resultDisplay setStringValue:@"The two dates are actually equal :)"];
        self.resultDisplay.textColor = NSColor.textColor;
    }
    else if(before){
        [self.resultDisplay setStringValue:@"Your date is before the selected date!"];
        self.resultDisplay.textColor = NSColor.textColor;
    }else{
        [self.resultDisplay setStringValue:@"Your date is after the selected date!"];
        self.resultDisplay.textColor = NSColor.textColor;
    }
}

//pre: user entered a date and selected a new date in the date picker
//post: print out the amount of days until the selected date
- (IBAction)daysUntilPushed:(id)sender {
    NSDate *inputDate = [self.dateInput dateValue];
    Date *newDate = [[Date alloc] initWithNSDate : inputDate];
    [self.dateDisplay setStringValue: [myDate toString]];
    int days = [myDate daysUntil:newDate];
    [self.resultDisplay setStringValue: [NSString stringWithFormat:@"You have %d days until the selected day",days]];
    self.resultDisplay.textColor = NSColor.textColor;
}


-(void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
    
}



@end
