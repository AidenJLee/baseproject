//
//  ALModelManager.h
//  ALModelManager
//
//  Created by HoJun Lee on 2014. 2. 10..
//  Copyright (c) 2014년 HoJun Lee. All rights reserved.
//

#import "ALObservation.h"

@interface ALModelManager : NSObject

// 이곳에 Data Model들을 Property로 등록한다.

+ (ALModelManager *)sharedInstance;
+ (void)releaseInstance;

@end
