//
//  AppDelegate.m
//  Ch16
//
//  Created by Cara Ellis on 12/10/12.
//  Copyright (c) 2012 Seth A. Vernon. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    

    UIView *v = self.window.rootViewController.view;
    CALayer *layer1 = [[CALayer alloc] init];
    layer1.frame = CGRectMake(0, 0, 320, 550);
    layer1.backgroundColor = [[UIColor colorWithRed:.4 green:0 blue:.4 alpha:1] CGColor];
    [v.layer addSublayer:layer1];
    
    CALayer *layer2 = [[CALayer alloc] init];
    layer2.backgroundColor = [[UIColor colorWithRed:0 green:1 blue:0 alpha:1] CGColor];
    layer2.frame = CGRectMake(50, 60, 220, 420);
    [layer1 addSublayer:layer2];
    
    CALayer *layer3 = [[CALayer alloc] init];
    layer3.frame = CGRectMake(55, 70, 110, 280);
    layer3.backgroundColor = [[UIColor colorWithRed:0 green:1 blue:1 alpha:1] CGColor];
    [layer2 addSublayer:layer3];
    
    
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
