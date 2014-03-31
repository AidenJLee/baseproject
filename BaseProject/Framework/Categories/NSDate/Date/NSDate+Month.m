//
//  NSDate+Month.m
//  PetsDiary
//
//  Created by HoJun Lee on 2013. 12. 29..
//  Copyright (c) 2013년 HoJun Lee. All rights reserved.
//

#import "NSDate+Month.h"
#import "NSDate+Components.h"

@implementation NSDate (Month)

- (NSInteger)month
{
    return [self componentsDate].month;
}

- (NSDate *)firstDateOfMonth
{
    NSDateComponents *components = [self componentsDate];
    components.day = 1;
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)lastDateOfMonth
{
    NSDateComponents *components = [self componentsDate];
    components.month++;
    components.day = 0;
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingMonth:(NSInteger)month
{
    NSDateComponents *components = [self componentsDate];
    components.month = month;
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)dateByAddingMonth:(NSInteger)month
{
    NSDateComponents *components = [self componentsDate];
    components.month = month;
    return [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:components toDate:self options:0];
}

@end
