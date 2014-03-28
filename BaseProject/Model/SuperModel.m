//
//  SuperModel.m
//  ALModelManager
//
//  Created by Aiden Lee on 2014. 2. 26..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
//

#import "SuperModel.h"

@implementation SuperModel


#pragma mark -
#pragma mark - Initialize
- (id)initWithDictionary:(NSDictionary *)jsonObject
{
    self = [super init];
    if (self) {
        self = [self init];
        [self setValuesForKeysWithDictionary:jsonObject];
    }
    return self;
}


#pragma mark -
#pragma mark - Key Value Observing Method
- (void)addKVOForOwner:(id)owner keyPaths:(NSString *)keyPaths block:(ALResponseBlock)responseBlock
{
    if (![keyPaths isEqualToString:@"*"]) {
        
        NSArray *arrKeyPaths = [keyPaths componentsSeparatedByString:@","];
        
        for (NSString *strKeyPath in arrKeyPaths) {
            
            // 공백 및 개행 제거 - [ @" ", @"\n" ];
            NSString *strTrimKeyPath  = [strKeyPath stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [self addObserverForKeyPath:strTrimKeyPath owner:owner block:^(NSString *observationKey, id observed, NSDictionary *change) {
                responseBlock(observationKey, observed, change);
            }];
            [owner observe:self keyPath:strTrimKeyPath block:^(NSString *observationKey, id observed, NSDictionary *change) {
                
            }];
            
        }
        
    } else {
        
        NSArray *arrKeyPaths = [self propertyNames];
        
        for (NSString *strKeyPath in arrKeyPaths) {
            
            // 공백 및 개행 제거 - [ @" ", @"\n" ];
            NSString *strTrimKeyPath  = [strKeyPath stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [self addObserverForKeyPath:strTrimKeyPath owner:owner block:^(NSString *observationKey, id observed, NSDictionary *change) {
                responseBlock(observationKey, observed, change);
            }];
            
        }
        
    }
}

- (void)removeAllKVOObservationsForOwner:(id)owner
{
    [self removeAllObserversForOwner:owner];
}

#pragma mark -
#pragma mark - String Checking Method
- (BOOL)containString:(NSString *)strSearch onText:(NSString *)strText
{
    return [strText rangeOfString:strSearch options:NSCaseInsensitiveSearch].location == NSNotFound ? FALSE : TRUE;
}


#pragma mark -
#pragma mark - KVC Method Implement
// 사용자 지정 키에 대한 올바른 키와 값의 매핑을 설정해야 하기때문에 서브 클래스 구현 함 / Objective-c 예약어와 키가 겹쳐서 충돌이 난다면 여기서 변경
- (id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"%s | Undefined Key: %@", __FUNCTION__, key);
    return nil;
}

// 내부에 Collection을 가지고 있다면 그 키를 가로채어 Model을 생성 후 넣어준다
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"Undefined Key: %@  Function : %s  Source Line : %d" , key, __FUNCTION__, __LINE__);
}


#pragma mark -
#pragma mark - NSCoder
- (BOOL)allowsKeyedCoding
{
	return YES;
}

- (id)initWithCoder:(NSCoder *)decoder
{
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	// do nothing.
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    SuperModel *model = [[SuperModel allocWithZone:zone] init];
    return model;
}

- (id)copyWithZone:(NSZone *)zone
{
    SuperModel *model = [[SuperModel allocWithZone:zone] init];
    return model;
}

@end
