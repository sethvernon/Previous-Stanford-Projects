//
//  AppDelegate.m
//  Ch14
//
//  Created by Cara Ellis on 12/10/12.
//  Copyright (c) 2012 Seth A. Vernon. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 550)];
    circle.backgroundColor = [UIColor colorWithRed:.2 green:.4 blue:2 alpha:1];
    
    UIView *circle0 = [[UIView alloc] initWithFrame:CGRectInset(circle.bounds, 50, 50)];
    circle0.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    
    UIView *circle1 = [[UIView alloc] initWithFrame:CGRectInset(circle0.bounds, 50, 50)];
    circle1.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0 alpha:1];
    
    UIView *circle2 = [[UIView alloc] initWithFrame:CGRectInset(circle1.bounds, 50, 50)];
    circle2.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    
    [self.window.rootViewController.view addSubview:circle];
    [circle addSubview:circle0];
    [circle0 addSubview:circle1];
    [circle1 addSubview:circle2];
    
    circle0.center = [circle convertPoint:circle.center fromView:circle.superview];
    circle1.center = [circle0 convertPoint:circle0.center fromView:circle0.superview];
    circle2.center = [circle1 convertPoint:circle1.center fromView:circle1.superview];
    
    
    
    
    
    
    
    
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
