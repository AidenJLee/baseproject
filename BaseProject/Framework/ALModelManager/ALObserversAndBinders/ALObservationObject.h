//
//  ALObservationObject.h
//  ALModelManager
//
//  Created by HoJun Lee on 2014. 2. 11..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ObservationObjectBlock)(NSString *observationKey, id observed, NSDictionary *change);

@interface ALObservationObject : NSObject

@property (nonatomic, assign) id owner;                     // 관찰 결과를 받는 대상
@property (nonatomic, assign) id source;                    // 관찰 대상
@property (nonatomic, assign) BOOL valid;                   // Observing 유무
@property (nonatomic, retain) NSString *keyPath;            // 관찰 할 대상에 대한 경로
@property (nonatomic, copy)   ObservationObjectBlock block; // 변화가 일어 났을 때 호출 되는 블럭

/**
 *  Observing을 더 이상 하지 않도록 하는 메소드
 */
- (void)invalidate;

/**
 *  콜백 블럭을 직접 호출 하는 메소드
 */
- (void)invoke;

@end
