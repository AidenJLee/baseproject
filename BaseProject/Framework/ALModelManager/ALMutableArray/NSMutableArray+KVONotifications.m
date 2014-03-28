//
//  NSMutableArray+KVONotifications.m
//  motelApp
//
//  Created by AidenLee on 2014. 3. 11..
//  Copyright (c) 2014년 yanolja. All rights reserved.
//

#import "NSMutableArray+KVONotifications.h"

@implementation NSMutableArray (KVONotifications)


#pragma mark -
#pragma mark - NSMutableArray (Default)
- (void)addObject:(id)anObject observeTarget:(id)target key:(NSString *)key
{
    
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:self.count];
    [target willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:key];
    [self addObject:anObject];
    [target didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:key];
    
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index observeTarget:(id)target key:(NSString *)key;
{
    
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:index];
    [target willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:key];
    [self insertObject:anObject atIndex:index];
    [target didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:key];
    
}

- (void)removeLastObjectForObserveTarget:(id)target key:(NSString *)key
{
    
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:self.count - 1];
    [target willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    [self removeLastObject];
    [target didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    
}

- (void)removeObjectAtIndex:(NSUInteger)index observeTarget:(id)target key:(NSString *)key
{
    
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:index];
    [target willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    [self removeObjectAtIndex:index];
    [target didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject observeTarget:(id)target key:(NSString *)key
{
    
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:index];
    [target willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:key];
    [self replaceObjectAtIndex:index withObject:anObject];
    [target didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:key];
    
}


#pragma mark -
#pragma mark - NSMutableArray (Extended)
- (void)addObjectsFromArray:(NSArray *)otherArray observeTarget:(id)target key:(NSString *)key
{
    
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(self.count, otherArray.count)];
    [target willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:key];
    [self addObjectsFromArray:otherArray];
    [target didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:key];
    
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 observeTarget:(id)target key:(NSString *)key
{
    
    [target willChange:NSKeyValueChangeReplacement valuesAtIndexes:[NSIndexSet indexSetWithIndex:idx1] forKey:key];
    [target willChange:NSKeyValueChangeReplacement valuesAtIndexes:[NSIndexSet indexSetWithIndex:idx2] forKey:key];
    [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
    [target didChange:NSKeyValueChangeReplacement valuesAtIndexes:[NSIndexSet indexSetWithIndex:idx1] forKey:key];
    [target didChange:NSKeyValueChangeReplacement valuesAtIndexes:[NSIndexSet indexSetWithIndex:idx2] forKey:key];
    
}

- (void)removeAllObjectsForObserveTarget:(id)target key:(NSString *)key
{
    
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.count)];
    [target willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    [self removeAllObjects];
    [target didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    
}

- (void)removeObject:(id)anObject inRange:(NSRange)range observeTarget:(id)target key:(NSString *)key
{
    
    NSUInteger objectIndex = [self indexOfObject:anObject inRange:range];
    if (objectIndex < self.count) {
        NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:objectIndex];
        [target willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
        [self removeObject:anObject inRange:range];
        [target didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    }
    
}

- (void)removeObject:(id)anObject observeTarget:(id)target key:(NSString *)key
{
    
    NSUInteger objectIndex = [self indexOfObject:anObject];
    if (objectIndex < self.count) {
        NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:objectIndex];
        [target willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
        [self removeObject:anObject];
        [target didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    }
    
}

- (void)removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range observeTarget:(id)target key:(NSString *)key
{
    
    NSUInteger objectIndex = [self indexOfObjectIdenticalTo:anObject inRange:range];
    if (objectIndex < self.count) {
        NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:objectIndex];
        [target willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
        [self removeObjectIdenticalTo:anObject inRange:range];
        [target didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    }
    
}

- (void)removeObjectIdenticalTo:(id)anObject observeTarget:(id)target key:(NSString *)key
{
    
    NSUInteger objectIndex = [self indexOfObjectIdenticalTo:anObject];
    if (objectIndex < self.count) {
        NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:objectIndex];
        [target willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
        [self removeObjectIdenticalTo:anObject];
        [target didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    }
    
}

- (void)removeObjectsInArray:(NSArray *)otherArray observeTarget:(id)target key:(NSString *)key
{
    
//    NSIndexPath *indexes = [self ]
}

- (void)removeObjectsInRange:(NSRange)range observeTarget:(id)target key:(NSString *)key
{
    
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:range];
    [target willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    [self removeObjectsInRange:range];
    [target didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    
}

- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange observeTarget:(id)target key:(NSString *)key
{
    
}

- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray observeTarget:(id)target key:(NSString *)key
{
    
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:range];
    [target willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:key];
    [self replaceObjectsInRange:range withObjectsFromArray:otherArray];
    [target didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:key];
    
}


- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes observeTarget:(id)target key:(NSString *)key
{
    
    [target willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:key];
    [self insertObjects:objects atIndexes:indexes];
    [target didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:key];
    
}

- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes observeTarget:(id)target key:(NSString *)key
{
    
    [target willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    [self removeObjectsAtIndexes:indexes];
    [target didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:key];
    
}

- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects observeTarget:(id)target key:(NSString *)key
{
    
    [target willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:key];
    [self replaceObjectsAtIndexes:indexes withObjects:objects];
    [target didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:key];
    
}


@end
