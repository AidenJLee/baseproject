//
//  NSDate+Week.m
//  PetsDiary
//
//  Created by HoJun Lee on 2014. 1. 3..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
//

#import "NSDate+Week.h"
#import "NSDate+Components.h"

@implementation NSDate (Week)

- (NSInteger)weekOfMonth
{
    return [self componentsWeek].weekOfMonth;
}

- (NSInteger)weekOfYear
{
    return [self componentsWeek].weekOfYear;
}

- (NSInteger)weekday
{
    return [self componentsWeek].weekday;
}

- (NSDate *)dateWeekStart
{
    NSDateComponents *components = [self componentsWeek];
    components.day -= components.weekday - 1;
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)dateWeekEnd
{
    NSDateComponents *components = [self componentsWeek];
    components.day += 7 - components.weekday;
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingWeekOfYear:(NSInteger)week
{
    NSDateComponents *components = [self componentsWeek];
    components.weekOfYear = week;
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingWeekOfMonth:(NSInteger)week
{
    NSDateComponents *components = [self componentsWeek];
    components.weekOfYear += week - components.weekOfMonth;
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingWeekday:(NSInteger)weekday
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekday = weekday - self.weekday;
    return [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingWeek:(NSInteger)week
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.week = week;
    return [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:components toDate:self options:0];
}

@end
