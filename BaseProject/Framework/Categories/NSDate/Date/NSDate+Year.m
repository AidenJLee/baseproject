//
//  NSDate+Year.m
//  PetsDiary
//
//  Created by HoJun Lee on 2013. 12. 29..
//  Copyright (c) 2013년 HoJun Lee. All rights reserved.
//

#import "NSDate+Year.h"
#import "NSDate+Components.h"

@implementation NSDate (Year)

- (NSInteger)year
{
    return [self componentsDate].year;
}

- (NSDate *)firstDateOfYearStart
{
    NSDateComponents *components = [self componentsDate];
    components.day = 1;
    components.month = 1;
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)lastDateOfYear
{
    NSDateComponents *components = [self componentsDate];
    components.day = 1;
    components.month = 1;
    components.year++;
    components.day--;
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)dateBySettingYear:(NSInteger)year
{
    NSDateComponents *components = [self componentsDateTime];
    components.year = year;
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (NSDate *)dateByAddingYear:(NSInteger)year
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = year;
    return [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:components toDate:self options:0];
}

@end
