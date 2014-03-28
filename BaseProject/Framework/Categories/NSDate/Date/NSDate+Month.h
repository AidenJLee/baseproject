//
//  NSDate+Month.h
//  PetsDiary
//
//  Created by HoJun Lee on 2013. 12. 29..
//  Copyright (c) 2013년 HoJun Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Month)

@property (nonatomic, readonly) NSInteger month;

- (NSDate *)firstDateOfMonth;
- (NSDate *)lastDateOfMonth;
- (NSDate *)dateBySettingMonth:(NSInteger)month;
- (NSDate *)dateByAddingMonth:(NSInteger)month;

@end
