//
//  BaseConsts.h
//  BaseProject
//
//  Created by AidenLee on 2014. 3. 28..
//  Copyright (c) 2014년 yanolja. All rights reserved.
//

#define SC(...)     [NSString stringWithFormat:__VA_ARGS__]

#pragma mark -
#pragma mark - Default Information

extern NSString * const     BASE_URL_STRING;    /*! 통신 기준 URL */
extern NSString * const     USERINFO_KEY;       /*! 사용자 정보 저장 키 */


#pragma mark -
#pragma mark - StoryBoard Segue ID
extern NSString * const     SEGUE_PUSH_INTRO_MAIN;
extern NSString * const     SEGUE_PUSH_MAIN_MENU;
extern NSString * const     SEGUE_PUSH_MAIN_CONTENT;

extern NSString * const     SEGUE_EMBED_SOMETHING;


#pragma mark -
#pragma mark - StoryBoard ID`s
extern NSString * const     STORYBOARD_MAIN_CONTAINER;


#pragma mark -
#pragma mark - Notification ID`s
extern NSString * const     NOTI_EVENT_DID_SELETE;
