//
//  NSDate+Components.m
//  PetsDiary
//
//  Created by HoJun Lee on 2013. 12. 30..
//  Copyright (c) 2013년 HoJun Lee. All rights reserved.
//

const NSUInteger flagsDate       = (NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear);
const NSUInteger flagsDateTime   = (NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear |
                                    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);

const NSUInteger flagsWeek       = (NSCalendarUnitMonth | NSCalendarUnitWeekOfMonth |
                                    NSCalendarUnitYear | NSCalendarUnitWeekOfYear |
                                    NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);
const NSUInteger flagsWeekday    = (NSCalendarUnitMonth | NSCalendarUnitWeekOfMonth |
                                    NSCalendarUnitYear | NSCalendarUnitWeekOfYear |
                                    NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);
const NSUInteger flagsWeekTime   = (NSCalendarUnitMonth | NSCalendarUnitWeekOfMonth |
                                    NSCalendarUnitYear | NSCalendarUnitWeekOfYear |
                                    NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal |
                                    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);

#import "NSDate+Components.h"

@implementation NSDate (Components)

- (NSDateComponents *)componentsDate
{
    return [[NSCalendar currentCalendar] components:flagsDate
                                           fromDate:self];
}

- (NSDateComponents *)componentsDateTime
{
    return [[NSCalendar currentCalendar] components:flagsDateTime
                                           fromDate:self];
}

- (NSDateComponents *)componentsWeek
{
    return [[NSCalendar currentCalendar] components:flagsWeek
                                           fromDate:self];
}

- (NSDateComponents *)componentsWeekday
{
    return [[NSCalendar currentCalendar] components:flagsWeekTime
                                           fromDate:self];
}

- (NSDateComponents *)componentsWeekTime
{
    return [[NSCalendar currentCalendar] components:flagsWeekTime
                                           fromDate:self];
}

- (NSDateComponents *)componentsWithFlags:(NSUInteger)flags fromSelfToDate:(NSDate *)date
{
    return [[NSCalendar currentCalendar] components:flags
                                           fromDate:self
                                             toDate:date
                                            options:kNilOptions];
}

@end
