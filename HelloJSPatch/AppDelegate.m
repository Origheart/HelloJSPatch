//
//  AppDelegate.m
//  HelloJSPatch
//
//  Created by Origheart on 16/4/28.
//  Copyright © 2016年 Origheart. All rights reserved.
//

#import "AppDelegate.h"
#import <JSPatch/JSPatch.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [JSPatch startWithAppKey:@"c08857f72a4e5f7b"];
    [JSPatch sync];
//    [JSPatch testScriptInBundle];
    return YES;
}

@end
