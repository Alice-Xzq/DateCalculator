//
//  Date.h
//  DateCalculator
//
//  Created by zxiao23 on 3/30/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef Date_h
#define Date_h

@interface Date : NSObject

@property int day;
@property int month;
@property int year;

//constructors
-(instancetype) initWithDay : (int)d month : (int)m year : (int)y;
-(instancetype) initWithNSDate : (NSDate*) inputDate;

//methods
-(bool)isEqualTo : (Date*) d; //(return true if the two dates are equal)
-(bool)isBefore : (Date*) d; //(returns true if the date of the object is before date d, false otherwise)
-(int)daysUntil : (Date*) d; //(returns the number of days until days d, the result should be negative is d is before the objects date)
-(Date*)nextWeek; //(returns the date one week from now)
-(Date*)lastWeek; //(returns the date one week before now)
-(NSString*)toString; //(returns the date as a NSString with the format of dd/MM/yyyy)

@end

#endif /* Date_h */
