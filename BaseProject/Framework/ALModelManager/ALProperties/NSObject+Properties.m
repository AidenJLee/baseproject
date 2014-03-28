//
//  NSObject+Properties.m
//  ALModelManager
//
//  Created by Aiden Lee on 2014. 2. 20..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
//

#import "NSObject+Properties.h"

@implementation NSObject (Properties)

+ (BOOL)hasProperties
{
    
	unsigned int count = 0;
	objc_property_t *properties = class_copyPropertyList(self, &count);
    free(properties);
    properties = NULL;
	return count != 0;
    
}

+ (BOOL)hasPropertyName:(NSString *)name
{
    
    if (class_getProperty(self, [name UTF8String]) != NULL) {
        return YES;
    }
    // 사용자가 실수로 name의 시작문자를 대문자로 넣었을 경우
    NSString *strPropertyStyleName = [[[name substringToIndex:1] lowercaseString] stringByAppendingString:[name substringFromIndex:1]];
	return class_getProperty(self, [strPropertyStyleName UTF8String]) != NULL;
    
}

+ (NSArray *)propertyNames
{
	return [[self class] propertyNamesWithSuperInquiry:NO];
}

+ (NSArray *)propertyNamesWithSuperInquiry:(BOOL)superInquiry
{
    
    unsigned int i, count = 0;
    objc_property_t *properties = class_copyPropertyList(self, &count);
    
    if (!count) {
        free(properties);
        properties = NULL;
		return nil;
	}
    
    // 반환 컨테이너
    NSMutableArray *propertyList = [[NSMutableArray alloc] init];
    
    for(i = 0; i < count; i++) {
        objc_property_t pObject = properties[i];
        const char *propertyName = property_getName(pObject);
        if(propertyName) {
            [propertyList addObject:@(propertyName)];
        }
    }
    free(properties);
    properties = NULL;
    
    // 상위 클래스 프로퍼티 검색
    if(superInquiry) {
        NSArray *arrPropertyNames = [[self superclass] propertyNamesWithSuperInquiry:YES];
        if(!arrPropertyNames) {
            [propertyList addObjectsFromArray:arrPropertyNames];
        }
    }
    return [NSArray arrayWithArray:propertyList];
    
}


#pragma mark -
#pragma mark - Instance Method
- (BOOL)hasProperties
{
    return [[self class] hasProperties];
}

- (BOOL)hasPropertyName:(NSString *)name
{
    return [[self class] hasPropertyName:name];
}

- (NSArray *)propertyNames
{
	return [[self class] propertyNames];
}

- (NSArray *)propertyNamesWithSuperInquiry:(BOOL)superInquiry
{
    return [[self class] propertyNamesWithSuperInquiry:superInquiry];
}

@end