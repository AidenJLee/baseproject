//
//  NSObject+ObjectObserver.m
//  ALModelManager
//
//  Created by HoJun Lee on 2014. 2. 12..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
//

#import "NSObject+ObjectObserver.h"
#import <objc/runtime.h>

#define OBJ_OBSERVING_KEY @"objectObserversKey"

@implementation NSObject (ObjectObserver)

#pragma mark -
#pragma mark - Public Method Implement
- (ALObservationObject *)addObserverForKeyPath:(NSString*)keyPath
                                         owner:(id)owner
                                         block:(ObservationObjectBlock)block
{
    return [self addObserverForKeyPath:keyPath
                                 owner:owner
                               options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
                                 block:block];
}

- (ALObservationObject *)addObserverForKeyPath:(NSString*)keyPath
                                         owner:(id)owner
                                       options:(NSKeyValueObservingOptions)options
                                         block:(ObservationObjectBlock)block
{
    
    ALObservationObject *binding = [[ALObservationObject alloc] init];
    
    binding.owner = owner;
    binding.source = self;
    binding.keyPath = keyPath;
    binding.block = block;
    
    [[self allObjectObservers] addObject:binding];
    [self addObserver:binding forKeyPath:keyPath options:options context:(__bridge void *)binding];
    
    return binding;
    
}

- (void)removeAllObservers
{
    for(ALObservationObject *binding in [NSArray arrayWithArray:[self allObjectObservers]]) {
        [binding invalidate];
        [[self allObjectObservers] removeObject:binding];
    }
}

- (void)removeAllObserversForOwner:(id)owner
{
    for(ALObservationObject *binding in [NSArray arrayWithArray:[self allObjectObservers]]) {
        if([binding.owner isEqual:owner]) {
            [binding invalidate];
            [[self allObjectObservers] removeObject:binding];
        }
    }
}

- (void)removeAllObserversForKeyPath:(NSString*)keyPath
{
    for(ALObservationObject *binding in [NSArray arrayWithArray:[self allObjectObservers]]) {
        if([binding.keyPath isEqualToString:keyPath]) {
            [binding invalidate];
            [[self allObjectObservers] removeObject:binding];
        }
    }
}

#pragma mark -
#pragma mark - Private Method
- (NSMutableArray *)allObjectObservers
{
	NSMutableArray *objects = objc_getAssociatedObject(self, OBJ_OBSERVING_KEY);
    if(!objects) {
        objects = [NSMutableArray array];
        objc_setAssociatedObject(self, OBJ_OBSERVING_KEY, objects, OBJC_ASSOCIATION_RETAIN);
    }
    return objects;
}

@end
