//
//  NSDate+Compare.m
//  PetsDiary
//
//  Created by HoJun Lee on 2013. 12. 29..
//  Copyright (c) 2013년 HoJun Lee. All rights reserved.
//

#import "NSDate+Compare.h"
#import "NSDate+Components.h"

#import "NSDate+Day.h"
#import "NSDate+Month.h"
#import "NSDate+Year.h"

@implementation NSDate (Compare)

- (BOOL)isEqualToDay:(NSDate *)toDay
{
    BOOL isToday = NO;
    if (self.day == toDay.day &&
        self.month == toDay.month &&
        self.year == toDay.year) {
        
        isToday = YES;
        
    }
    return isToday;
}

/*!  NSComparisonResult
 Return Value           Description
 NSOrderedAscending     receiver < argument
 NSOrderedSame          receiver == argument
 NSOrderedDescending	receiver > argument
 */
- (BOOL)isLessThanDate:(NSDate *)date
{
    return [self compare:date] == NSOrderedAscending;
}

- (BOOL)isGreaterThanDate:(NSDate *)date
{
    return [self compare:date] == NSOrderedDescending;
}

- (BOOL)isLessThanOrEqualToDate:(NSDate *)date
{
    return [self isLessThanDate:date] || [self isEqualToDate:date];
}

- (BOOL)isGreaterThanOrEqualToDate:(NSDate *)date
{
    return [self isGreaterThanDate:date] || [self isEqualToDate:date];
}

// Calculation
- (NSInteger)compareDayToDate:(NSDate *)toDate
{
    return [[self componentsWithFlags:NSCalendarUnitDay fromSelfToDate:toDate] day];
}

- (NSInteger)compareMonthToDate:(NSDate *)toDate
{
    return [[self componentsWithFlags:NSCalendarUnitMonth fromSelfToDate:toDate] month];
}

- (NSInteger)compareYearToDate:(NSDate *)toDate
{
    return [[self componentsWithFlags:NSCalendarUnitYear fromSelfToDate:toDate] year];
}

- (NSInteger)compareSecondToDate:(NSDate *)toDate
{
    return [[self componentsWithFlags:NSCalendarUnitSecond fromSelfToDate:toDate] second];
}

- (NSInteger)compareMinuteToDate:(NSDate *)toDate
{
    return [[self componentsWithFlags:NSCalendarUnitMinute fromSelfToDate:toDate] minute];
}

- (NSInteger)compareHourToDate:(NSDate *)toDate
{
    return [[self componentsWithFlags:NSCalendarUnitHour fromSelfToDate:toDate] hour];
}

@end
