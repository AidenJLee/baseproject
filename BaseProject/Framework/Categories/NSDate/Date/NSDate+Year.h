//
//  NSDate+Year.h
//  PetsDiary
//
//  Created by HoJun Lee on 2013. 12. 29..
//  Copyright (c) 2013년 HoJun Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Year)

@property (nonatomic, readonly) NSInteger year;

- (NSDate *)firstDateOfYearStart;
- (NSDate *)lastDateOfYear;
- (NSDate *)dateBySettingYear:(NSInteger)year;
- (NSDate *)dateByAddingYear:(NSInteger)year;

@end
