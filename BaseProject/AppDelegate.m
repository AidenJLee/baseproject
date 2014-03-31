//
//  AppDelegate.m
//  BaseProject
//
//  Created by AidenLee on 2014. 3. 28..
//  Copyright (c) 2014년 yanolja. All rights reserved.
//

#import "AppDelegate.h"
#import "NSDateHelper.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    NSDate *now = [NSDate dateWithTimeIntervalSinceNow:-1];
    NSDate *add7days = [now dateByAddingDays:7];
    NSLog(@"now  : %@ " , [NSDate date]);
    NSLog(@"now -1  : %@ " , now);
    NSLog(@"add Date : %@ " , add7days);
    NSLog(@"Compare Second : %ld " , (long)[add7days compareSecondToDate:[NSDate date]]);
    NSLog(@"Compare Second : %ld " , (long)[add7days compareSecondToDate:now]);
    NSLog(@"Compare Day : %ld " , (long)[add7days compareDayToDate:[NSDate date]]);
    NSLog(@"Compare Day : %ld " , (long)[add7days compareDayToDate:now]);
    NSLog(@"Compare : %ld " , (long)[add7days compareHourToDate:[NSDate date]]);
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
