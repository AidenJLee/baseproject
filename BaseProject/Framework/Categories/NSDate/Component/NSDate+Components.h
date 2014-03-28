//
//  NSDate+Components.h
//  PetsDiary
//
//  Created by HoJun Lee on 2013. 12. 30..
//  Copyright (c) 2013년 HoJun Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Components)

- (NSDateComponents *)componentsDate;
- (NSDateComponents *)componentsDateTime;

- (NSDateComponents *)componentsWeek;
- (NSDateComponents *)componentsWeekTime;
- (NSDateComponents *)componentsWeekday;

- (NSDateComponents *)componentsWithFlags:(NSUInteger)flags fromSelfToDate:(NSDate *)date;

@end

