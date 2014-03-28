//
//  ALModelManager.m
//  ALModelManager
//
//  Created by HoJun Lee on 2014. 2. 10..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
//

#import "ALModelManager.h"


@implementation ALModelManager


#pragma mark -
#pragma mark SIngleton Create & Release
static ALModelManager *_modelManager = nil;
+ (ALModelManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _modelManager = [[ALModelManager alloc] initModelManager];
    });
    return _modelManager;
}

+ (void)releaseInstance
{
    _modelManager = nil;
}


#pragma mark -
#pragma mark - Init & Dealloc

- (id)initModelManager
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)init
{
    NSAssert(NO, @"Can`t create instance With Init Method");
    return nil;
}

- (void)dealloc
{
    
}

@end

/*
- (void)addCustomKVOForOwner:(id)owner object:(id)object keyPaths:(NSString *)keyPaths block:(ALResponseBlock)responseBlock
{
    
    
    
}

- (void)addCollectionKVOForOwner:(id)owner object:(id)object keyPaths:(NSString *)keyPaths block:(ALResponseBlock)responseBlock
{
    
    NSParameterAssert(owner);
    NSParameterAssert(keyPaths);
    
    // 중복 및 개행 제거 - [ @" ", @"\n" ];
    NSString *strTrimKeyPaths = [keyPaths stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    // 하나 이상의 KeyPath를 (,)기준으로 분리
    NSArray *arrKeyPaths = [strTrimKeyPaths componentsSeparatedByString:@","];
    
    // 하나 이상의 KeyPath를 분리
    NSMutableArray *arrAbsoluteKeyPaths = [self createKeyPathArrayForKeyPathString:arrKeyPaths];
    
    for (NSString *keypath in arrAbsoluteKeyPaths) {
        
        NSMutableArray *arrTargets = [_observationManager objectForKey:keypath];
        if (!arrTargets) {
            arrTargets = [[NSMutableArray alloc] initWithObjects:object, nil];
            // 관리 오브젝트 등록
            [_observationManager setObject:arrTargets forKey:keypath];
            // KVO 등록
            [object addObserverForKeyPath:keyPaths owner:owner block:^(NSString *observationKey, id observed, NSDictionary *change) {
                responseBlock(observationKey, observed, [change valueForKey:NSKeyValueChangeNewKey]);
            }];
        } else if (![arrTargets containsObject:owner]) {
            [arrTargets addObject:object];
            // 관리 오브젝트 등록
            [_observationManager setObject:arrTargets forKey:keypath];
            // KVO 등록
            [object addObserverForKeyPath:keyPaths owner:owner block:^(NSString *observationKey, id observed, NSDictionary *change) {
                responseBlock(observationKey, observed, [change valueForKey:NSKeyValueChangeNewKey]);
            }];
        } else {
            // 이미 등록 되어 있는것으로 판단
        }
        
    }
    
}

- (void)removeAllObservers
{
    [self removeAllObservers];
    [self removeAllObservations];
}

- (BOOL)removeAllObserverForOwner:(id)owner
{
    return YES;
}

- (BOOL)removeAllObserverForOwner:(id)owner keyPaths:(NSString *)keyPaths
{
    return YES;
}

#pragma mark -
#pragma mark - Private Method
- (NSMutableArray *)createKeyPathArrayForKeyPathString:(NSArray *)arrKeyPaths;
{
    
    // 반환 객체
    NSMutableArray *arrResponse = [[NSMutableArray alloc] init];
    
    for (NSString *strKeyPath in arrKeyPaths) {
        
        // KeyPath 내부에 *가 포함되어 있다면 모든 프로퍼티 이름을 가져와 KeyPath 생성
        if ([self containString:strKeyPath onText:@"*"]) {
            
            NSString *propertyKeyPath = [strKeyPath stringByReplacingOccurrencesOfString:@".*" withString:@""];
            
            // Property 이름을 목록으로 가져오기
            NSArray *arrPropertyNames = [ALIntrospection getPropertyNamesOfClass:[[self valueForKeyPath:propertyKeyPath] class] superInquiry:NO];
            
            for (NSString *strPropertyKey in arrPropertyNames) {
                
                NSString *absoluteKeyPath = [strKeyPath stringByReplacingOccurrencesOfString:@"*" withString:strPropertyKey];
                if (![arrResponse containsObject:absoluteKeyPath]) {
                    [arrResponse addObject:[absoluteKeyPath stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
                }
                
            }
            
        } else {
            [arrResponse addObject:[strKeyPath stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        }
        
    }
    
    return arrResponse;
    
}

- (BOOL)setValueForKeyPath:(NSString*)keyPath andValue:(id)Value andTargetObject:(id)object
{
    [object setValue:Value forKeyPath:keyPath];
    
    return YES;
}

- (BOOL)containString:(NSString *)strSearch onText:(NSString *)strText
{
    return [strText rangeOfString:strSearch options:NSCaseInsensitiveSearch].location == NSNotFound ? FALSE : TRUE;
}

#pragma mark -
#pragma mark SIngleton Create & Release
static ALModelManager *_modelManager = nil;
+ (ALModelManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _modelManager = [[ALModelManager alloc] initModelManager];
    });
    return _modelManager;
}

+ (void)releaseInstance
{
    _modelManager = nil;
}

#pragma mark -
#pragma mark - Active&Terminate
- (void)didActiveManager
{
    
}

- (void)didTerminateManager
{
    
}

#pragma mark -
#pragma mark - Init & Dealloc

- (id)initModelManager
{
    self = [super init];
    if (self) {
        // do something~
        _observationManager = [[NSMutableDictionary alloc] initWithCapacity:10];
    }
    return self;
}

- (id)init
{
    NSAssert(NO, @"Can`t create instance With Init Method");
    return nil;
}

- (void)dealloc
{
    _observationManager = nil;
}

@end
 */
