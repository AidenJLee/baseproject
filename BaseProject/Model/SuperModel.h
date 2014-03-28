//
//  SuperModel.h
//  ALModelManager
//
//  Created by Aiden Lee on 2014. 2. 26..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
// 뭐.. 슈퍼모델이 이뻐서 이렇게 네이밍 한건 아니고. . .

#import <Foundation/Foundation.h>
#import "ALObservation.h"
#import "NSObject+Properties.h"

typedef void (^ALResponseBlock)(NSString *observedKey, id observed, id changedObject);

@interface SuperModel : NSObject <NSCoding, NSCopying, NSMutableCopying>


#pragma mark -
#pragma mark - Initialize
- (id)initWithDictionary:(NSDictionary *)jsonObject;

#pragma mark -
#pragma mark - Key Value Observing Method
- (void)addKVOForOwner:(id)owner keyPaths:(NSString *)keyPaths block:(ALResponseBlock)responseBlock;
- (void)removeAllKVOObservationsForOwner:(id)owner;

#pragma mark -
#pragma mark - Helper Method
- (BOOL)containString:(NSString *)strSearch onText:(NSString *)strText;

@end
