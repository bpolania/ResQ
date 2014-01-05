//
//  AppDelegate.m
//  iResQ
//
//  Created by Boris Polania on 1/4/14.
//  Copyright (c) 2014 LLT. All rights reserved.
//

#import "AppDelegate.h"
#import <FYX/FYX.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [FYX setAppId:@"06f64935cc3269d795580b8e4bd93165de8b6beade7f431c1bbf2923f88952e2" appSecret:@"50a4f680b0a853e9890c4542b9f5950b49b2041e9a7cc7a545ce5a024b618222" callbackUrl:@"iresq://authcode "];
    
    [Parse setApplicationId:@"db3fhJKP9FlNqKS56LlG1AuVsrC8EV6NE7JSnENs"
                  clientKey:@"MBP6GS10Kok7s5Dbj20gkuQf12PPgbCMVV0PXrnZ"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
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
