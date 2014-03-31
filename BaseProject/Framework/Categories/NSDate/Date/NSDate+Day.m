//
//  NSDate+Day.m
//  PetsDiary
//
//  Created by HoJun Lee on 2013. 12. 29..
//  Copyright (c) 2013년 HoJun Lee. All rights reserved.
//

#import "NSDate+Day.h"
#import "NSDate+Components.h"

@implementation NSDate (Day)

- (NSInteger)day
{
    return [[self componentsDate] day];
}

- (NSDate *)dateToday
{
    NSDateComponents *components = [self componentsDate];
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingDay:(NSInteger)day
{
    NSDateComponents *components = [self componentsDate];
    components.day = day;
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)dateByAddingDays:(NSInteger)days
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = days;
    return [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:components toDate:self options:0];
}

@end
