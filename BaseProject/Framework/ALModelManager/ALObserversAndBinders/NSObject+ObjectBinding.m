//
//  NSObject+ObjectBinding.m
//  ALModelManager
//
//  Created by HoJun Lee on 2014. 2. 12..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
//

#import "NSObject+ObjectBinding.h"
#import "NSObject+Observation.h"

#import <objc/runtime.h>

#define OBJ_BINDING_KEY @"objectBindersKey"

@implementation NSObject (ObjectBinding)

#pragma mark -
#pragma mark - Public Method Implement
- (void)bindSourceKeyPath:(NSString *)sourcePath to:(id)target targetKeyPath:(NSString *)targetPath reverseMapping:(BOOL)reverseMapping
{
    
    [[self allKeyPathBindings] addObject:[self observe:self keyPath:sourcePath block:^(NSString *observationKey, id observed, NSDictionary *change) {
        [target setValue:[change valueForKey:NSKeyValueChangeNewKey] forKey:targetPath];
    }]];
    
    if(reverseMapping) {
        [[self allKeyPathBindings] addObject:[self observe:target keyPath:targetPath block:^(NSString *observationKey, id observed, NSDictionary *change) {
            [self setValue:[change valueForKey:NSKeyValueChangeNewKey] forKey:sourcePath];
        }]];
    }
    
}

- (void)unbindKeyPath:(NSString *)keyPath
{
    NSArray *bindings = [self allKeyPathBindings];
    for(ALObservationObject *binding in bindings)
    {
        if([binding.keyPath isEqualToString:keyPath])
        {
            [binding invalidate];
            binding.block = nil;
            [[self allKeyPathBindings] removeObject:binding];
        }
    }
}

- (void)unbindAllKeyPaths
{
    for(ALObservationObject *binding in [self allKeyPathBindings])
    {
        [binding invalidate];
        binding.block = nil;
    }
    
    [[self allKeyPathBindings] removeAllObjects];
}

#pragma mark -
#pragma mark - Private Method
- (NSMutableArray *)allKeyPathBindings
{
	NSMutableArray *objects = objc_getAssociatedObject(self, OBJ_BINDING_KEY);
    if(!objects) {
        objects = [NSMutableArray array];
        objc_setAssociatedObject(self, OBJ_BINDING_KEY, objects, OBJC_ASSOCIATION_RETAIN);
    }
    return objects;
}

@end
