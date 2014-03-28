//
//  SideGestureDelegate.h
//  motelApp
//
//  Created by AidenLee on 2014. 3. 21..
//  Copyright (c) 2014년 yanolja. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SideState) {
    SideOpen,
    SideClose,
};

@protocol SideGestureDelegate <NSObject>
@optional
- (void)didMoveSideViewForDirection:(SideState)direction;
@end

@interface SideGestureDelegate : NSObject

@property (nonatomic) BOOL enabled;
@property (nonatomic) SideState slidingState;
@property (nonatomic, weak) id <SideGestureDelegate> delegate;

#pragma mark -
#pragma mark Public Method
- (id)initWithUserInfo:(id)userInfo;
- (void)didMoveSideViewForDirection:(SideState)direction;

@end
