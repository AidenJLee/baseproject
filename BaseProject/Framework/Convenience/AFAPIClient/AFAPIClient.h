//
//  AFAPIClient.h
//  DateQ
//
//  Created by HoJun Lee on 2014. 1. 25..
//  Copyright (c) 2014년 Plan2white. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
