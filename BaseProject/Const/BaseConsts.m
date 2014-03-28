//
//  BaseConsts.m
//  BaseProject
//
//  Created by AidenLee on 2014. 3. 28..
//  Copyright (c) 2014년 yanolja. All rights reserved.
//

#import "BaseConsts.h"

#pragma mark -
#pragma mark - Default Information
NSString * const     BASE_URL_STRING            = @"서버와 통신에 필요한 기본 URL 주소값을 넣어 주세요";
NSString * const     USERINFO_KEY               = @"NSUserDefaults 에 기본정보를 저장하기 위한 키 값을 넣어 주세요";


#pragma mark -
#pragma mark - Segue Key`s
NSString * const     SEGUE_PUSH_INTRO_MAIN      = @"스토리보드에서 Segue로 Push 컨트롤 할 필요가 있을 때 Segue ID를 넣어 주세요";
NSString * const     SEGUE_PUSH_MAIN_MENU       = @"스토리보드에서 Segue로 Push 컨트롤 할 필요가 있을 때 Segue ID를 넣어 주세요";
NSString * const     SEGUE_PUSH_MAIN_CONTENT    = @"스토리보드에서 Segue로 Push 컨트롤 할 필요가 있을 때 Segue ID를 넣어 주세요";

NSString * const     SEGUE_EMBED_SOMETHING      = @"스토리보드에서 Segue로 Embeded로 컨트롤러를 가져올 필요가 있을 때 Segue ID를 넣어 주세요";


#pragma mark -
#pragma mark - StoryBoard ID`s
NSString * const     STORYBOARD_MAIN_CONTAINER  = @"스토리보드에서 컨트롤러를 가져올 필요가 있을 때 ViewController ID를 넣어 주세요";


#pragma mark -
#pragma mark - Notification ID`s
NSString * const     NOTI_EVENT_DID_SELETE      = @"프로젝트 전역에서 NSNotificationCenter 이벤트를 처리할 게 있다면 여기에 넣어 주세요";
