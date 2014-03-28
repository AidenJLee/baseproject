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
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *components = [self componentsDate];
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateBySettingDay:(NSInteger)day
{
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *components = [self componentsDate];
    components.day = day;
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateByAddingDays:(NSInteger)days
{
    NSDateComponents *components = [self componentsDate];
    components.day = days;
    return [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:components
                                                                     toDate:self
                                                                    options:kNilOptions];
}

@end
