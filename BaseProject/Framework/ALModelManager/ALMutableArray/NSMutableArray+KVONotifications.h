//
//  NSMutableArray+KVONotifications.h
//  motelApp
//
//  Created by AidenLee on 2014. 3. 11..
//  Copyright (c) 2014년 yanolja. All rights reserved.
//
//  예외처리는 거의 안함. 예외로 인한 에러는 셀프 처리.
//  이유는 예외 처리해서 무시해버리면 사용자(개발자)는 데이터가 처리 되었다고 생각할 수도 있기 때문... - '믿지마~ 직접 확인해~'

#import <Foundation/Foundation.h>

@interface NSMutableArray (KVONotifications)


#pragma mark -
#pragma mark - NSMutableArray (Default)
- (void)addObject:(id)anObject observeTarget:(id)target key:(NSString *)key;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index observeTarget:(id)target key:(NSString *)key;
- (void)removeLastObjectForObserveTarget:(id)target key:(NSString *)key;
- (void)removeObjectAtIndex:(NSUInteger)index observeTarget:(id)target key:(NSString *)key;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject observeTarget:(id)target key:(NSString *)key;


#pragma mark -
#pragma mark - NSMutableArray (Extended)
- (void)addObjectsFromArray:(NSArray *)otherArray observeTarget:(id)target key:(NSString *)key;
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 observeTarget:(id)target key:(NSString *)key;
- (void)removeAllObjectsForObserveTarget:(id)target key:(NSString *)key;
- (void)removeObject:(id)anObject inRange:(NSRange)range observeTarget:(id)target key:(NSString *)key;
- (void)removeObject:(id)anObject observeTarget:(id)target key:(NSString *)key;
- (void)removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range observeTarget:(id)target key:(NSString *)key;
- (void)removeObjectIdenticalTo:(id)anObject observeTarget:(id)target key:(NSString *)key;
//- (void)removeObjectsInArray:(NSArray *)otherArray observeTarget:(id)target key:(NSString *)key;
- (void)removeObjectsInRange:(NSRange)range observeTarget:(id)target key:(NSString *)key;
//- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange observeTarget:(id)target key:(NSString *)key;
- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray observeTarget:(id)target key:(NSString *)key;

- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes observeTarget:(id)target key:(NSString *)key;
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes observeTarget:(id)target key:(NSString *)key;
- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects observeTarget:(id)target key:(NSString *)key;


@end
