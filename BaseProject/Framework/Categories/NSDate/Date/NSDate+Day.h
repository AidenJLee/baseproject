//
//  NSDate+Day.h
//  PetsDiary
//
//  Created by HoJun Lee on 2013. 12. 29..
//  Copyright (c) 2013년 HoJun Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Day)

@property (nonatomic, readonly) NSInteger day;

- (NSDate *)dateToday;
- (NSDate *)dateBySettingDay:(NSInteger)day;
- (NSDate *)dateByAddingDays:(NSInteger)days;

@end
