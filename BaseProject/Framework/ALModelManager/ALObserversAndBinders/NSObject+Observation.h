//
//  NSObject+Observation.h
//  ALModelManager
//
//  Created by HoJun Lee on 2014. 2. 11..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
//

#import "ALObservationObject.h"

@interface NSObject (Observation)

/**
 * Same as above, except the default options are set to NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
 *
 * @param object The object to observe
 * @param keyPath The keypath of the property to observe using KVO
 * @param block the block that should be invoked when the keyPath changes
 * @return An object representing the binding, this does NOT need to be retained
 */
- (ALObservationObject *)observe:(id)object
                         keyPath:(NSString *)keyPath
                           block:(ObservationObjectBlock)block;

/**
 * Observe the keypath with the provided block while the returned object is retained
 *
 * @param object The object to observe
 * @param keyPath The keypath of the property to observe using KVO
 * @param options The ORd set of NSKeyValueObservingOptions
 * @param block the block that should be invoked when the keyPath changes
 * @return An object representing the binding, this does NOT need to be retained
 */
- (ALObservationObject *)observe:(id)object
                         keyPath:(NSString *)keyPath
                         options:(NSKeyValueObservingOptions)options
                           block:(ObservationObjectBlock)block;

/**
 *  모든 observation을 지운다. 기존 KVO Observers에는 영향을 미치지 않는다.
 */
- (void)removeAllObservations;


/**
 *  주어진 object에 해당하는 observation을 지운다
 *
 *  @param object observation을 지우려는 object
 */
- (void)removeAllObservationsForObject:(id)object;


/**
 * 주어진 object의 observation중에 keypath에 해당하는것을 지운다
 *
 * @param object observation을 지우려는 object
 * @param keyPath 지우려는 옵저버의 property keypath
 */
- (void)removeObservationsForObject:(id)object keyPath:(NSString*)keyPath;

@end
