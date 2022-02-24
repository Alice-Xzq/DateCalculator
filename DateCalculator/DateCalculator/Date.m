//
//  Date.m
//  DateCalculator
//
//  Created by zxiao23 on 3/30/21.
//  Cite Jerry Yuan for debugging.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Date.h"

@implementation Date{
    NSArray *daysInMonth;
}


//constructor
//initialize a Date Object with day, month, year all set to 0
-(instancetype) init
{
    self = [super init];
    if(self){
        self.day = 0;
        self.month = 0;
        self.year = 0;
    }
    [self initDaysArray];
    return self;
}
//initialize a Date Object with day, month, year all set to input value
-(instancetype) initWithDay : (int)d month : (int)m year : (int)y
{
    self = [super init];
    if(self){
        self.day = d;
        self.month = m;
        self.year = y;
    }
    [self initDaysArray];
    return self;
}
//initialize a Date Object with day, month, year from a NSDate Object
-(instancetype) initWithNSDate : (NSDate*) inputDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    //    Optionally for time zone conversions
    //    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];

    [formatter setDateFormat:@"yyyy"];
    NSString *yearStr = [formatter stringFromDate:inputDate];
    int newYear = [yearStr intValue];
   
    [formatter setDateFormat:@"MM"];
    NSString *monthStr = [formatter stringFromDate:inputDate];
    int newMonth = [monthStr intValue];
   
    [formatter setDateFormat:@"dd"];
    NSString *dayStr = [formatter stringFromDate:inputDate];
    int newDay = [dayStr intValue];
    
    self = [super init];
    if(self){
        self.day = newDay;
        self.month = newMonth;
        self.year = newYear;
    }
    [self initDaysArray];
    return self;
}

//initialize the "daysInMonth" array to the number of days in each month
-(void)initDaysArray{
    daysInMonth = @[@31, @28, @31, @30, @31, @30, @31, @31, @30, @31, @30, @31];
//    for(int i = 0; i < 12; i++){
//        NSLog([[daysInMonth objectAtIndex:i] stringValue]);
//    }
}

//methods
//returns true if the date of the object is before date d, false otherwise
-(bool)isBefore : (Date*) d{
    if(d.year > self.year || (d.year == self.year && d.month > self.month) || (d.year == self.year && d.month == self.month && d.day > self.day)){
        return NO;
    }
    return YES;
}

//return true if the two dates are equal
-(bool)isEqualTo : (Date*) d{
    if(self.day == d.day && self.month == d.month && self.year == d.year){
        return YES;
    }
    return NO;
}

//returns the number of days until days d, the result should be negative is d is before the objects date
-(int)daysUntil : (Date*) d{
    int yearDiff = d.year - self.year;
    int days = (yearDiff/4)*(365*3+366) + yearDiff%4*365;
    
    if(self.month < d.month){
        for(int i = self.month-1; i < d.month-1; i++){
            days = days + [[daysInMonth objectAtIndex:i] intValue];
        }
    }
    if(self.month > d.month){
        for(int i = d.month-1; i < self.month-1; i++){
            days = days - [[daysInMonth objectAtIndex:i] intValue];
        }
    }
    days = days - self.day + d.day;
    //takes account of gapyear
    if((self.year%4 == 0 && self.month <= 2 && yearDiff%4 <= 2 && yearDiff%4 > 0) ||
       (d.year%4 == 0 && d.month > 2 && yearDiff%4 <= 2 && yearDiff%4 > 0) || (yearDiff % 4 == 2 && (self.year + self.year + 2)%4 == 0) || (yearDiff % 4 == -2 && (d.year + d.year + 2)%4 == 0) || yearDiff%4 > 2 || yearDiff%4 < -2){
        days++;
    }
    return days;
}

//returns the date one week from now
-(Date*)nextWeek
{
    int limit = [[daysInMonth objectAtIndex:self.month-1] intValue];
    if(self.year%4 == 0 && self.month == 2){
        limit = 29;
    }
    if(self.day + 7 > limit){
        if(self.month == 12){
            return [[Date alloc] initWithDay:self.day + 7 - limit month:1 year:self.year+1];
        }
        return [[Date alloc] initWithDay:self.day + 7 - limit month:self.month+1 year:self.year];
    }
    return [[Date alloc] initWithDay:self.day + 7 month:self.month year:self.year];
}

//returns the date one week before now
-(Date*)lastWeek
{
    if(self.day - 7 <= 0){
        if(self.month == 1){
            return [[Date alloc] initWithDay:31-(7 - self.day)  month:12 year:self.year-1];
        }
        int limit = [[daysInMonth objectAtIndex:self.month-2] intValue];
        if(self.year%4 == 0 && self.month == 3){
            limit = 29;
        }
        return [[Date alloc] initWithDay:limit - (7 - self.day)  month:self.month-1 year:self.year];
    }
    return [[Date alloc] initWithDay:self.day - 7 month:self.month year:self.year];
}

//returns the date as a NSString with the format of dd/MM/yyyy
-(NSString*)toString{
    NSString *str = [NSString stringWithFormat:@"%d / %d / %d", self.month, self.day, self.year];
    return str;
}

@end
