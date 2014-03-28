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
    return [[NSCalendar autoupdatingCurrentCalendar] components:flagsDate
                                                       fromDate:self];
}

- (NSDateComponents *)componentsDateTime
{
    return [[NSCalendar autoupdatingCurrentCalendar] components:flagsDateTime
                                                       fromDate:self];
}

- (NSDateComponents *)componentsWeek
{
    return [[NSCalendar autoupdatingCurrentCalendar] components:flagsWeek
                                                       fromDate:self];
}

- (NSDateComponents *)componentsWeekday
{
    return [[NSCalendar autoupdatingCurrentCalendar] components:flagsWeekTime
                                                       fromDate:self];
}

- (NSDateComponents *)componentsWeekTime
{
    return [[NSCalendar autoupdatingCurrentCalendar] components:flagsWeekTime
                                                       fromDate:self];
}

- (NSDateComponents *)componentsWithFlags:(NSUInteger)flags fromSelfToDate:(NSDate *)date
{
    return [[NSCalendar autoupdatingCurrentCalendar] components:flags
                                                       fromDate:self
                                                         toDate:date
                                                        options:kNilOptions];
}

@end
