//
//  NSDate+Compare.h
//  PetsDiary
//
//  Created by HoJun Lee on 2013. 12. 29..
//  Copyright (c) 2013년 HoJun Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Compare)

- (BOOL)isEqualToDay:(NSDate *)toDay;
- (BOOL)isLessThanDate:(NSDate *)date;
- (BOOL)isGreaterThanDate:(NSDate *)date;
- (BOOL)isLessThanOrEqualToDate:(NSDate *)date;
- (BOOL)isGreaterThanOrEqualToDate:(NSDate *)date;

- (NSInteger)compareDayToDate:(NSDate *)toDate;
- (NSInteger)compareMonthToDate:(NSDate *)toDate;
- (NSInteger)compareYearToDate:(NSDate *)toDate;
- (NSInteger)compareSecondToDate:(NSDate *)toDate;
- (NSInteger)compareMinuteToDate:(NSDate *)toDate;
- (NSInteger)compareHourToDate:(NSDate *)toDate;

@end
