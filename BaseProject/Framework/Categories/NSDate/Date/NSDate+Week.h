//
//  NSDate+Week.h
//  PetsDiary
//
//  Created by HoJun Lee on 2014. 1. 3..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Week)

@property (nonatomic, readonly) NSInteger weekOfMonth;
@property (nonatomic, readonly) NSInteger weekOfYear;
@property (nonatomic, readonly) NSInteger weekday;

- (NSDate *)dateWeekStart;
- (NSDate *)dateWeekEnd;
- (NSDate *)dateBySettingWeekOfYear:(NSInteger)week;
- (NSDate *)dateBySettingWeekOfMonth:(NSInteger)week;
- (NSDate *)dateBySettingWeekday:(NSInteger)weekday;
- (NSDate *)dateByAddingWeek:(NSInteger)week;

@end
