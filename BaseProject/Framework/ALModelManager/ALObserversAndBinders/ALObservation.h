//
//  ALObservation.h
//  ALModelManager
//
//  Created by HoJun Lee on 2014. 2. 12..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
//
// 출처 - https://github.com/rayh/kvo-block-binding


#import "NSObject+Observation.h"
#import "NSObject+ObjectObserver.h"
#import "NSObject+ObjectBinding.h"
/*
 Observation Example
 [self observe:model keyPath:@"somePropertyKey" block:^(id observed, NSDictionary *change) {
 NSLog(@"observed : %@ " , observed);
 NSLog(@"new Object: %@ " , [change objectForKey:NSKeyValueChangeNewKey]);
 }];
 */

/*
 ObjectObserver Example
 [self.model addObserverForKeyPath:@"somePropertyKey" owner:self block:^(id observed, NSDictionary *change) {
 NSLog(@"observed : %@ " , observed);
 NSLog(@"new Object: %@ " , [change objectForKey:NSKeyValueChangeNewKey]);
 }];
 */

/*
 ObjectBinding Example
 [self.Button bindSourceKeyPath:@"seleted" to:imageView targetKeyPath:@"image" reverseMapping:YES];
 
 // add one way blocks to observe the stepper values
 [self observe:Button keyPath:@"seleted" block:^(id observed, NSDictionary *change) {
    //do something
 }];
 [self observe:imageView keyPath:@"image" block:^(id observed, NSDictionary *change) {
    //do something
 }];
 */
