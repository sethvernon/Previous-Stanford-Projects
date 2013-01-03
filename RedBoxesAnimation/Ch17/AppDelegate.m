//
//  AppDelegate.m
//  Ch17
//
//  Created by Seth Vernon on 12/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	
	// create box
	UIView *box = [[UIView alloc] initWithFrame:CGRectMake(135, 200, 50, 50)];
	box.backgroundColor = [UIColor redColor];
	[self.window.rootViewController.view addSubview:box];
	

	self.window.backgroundColor = [UIColor blueColor];
	[self.window makeKeyAndVisible];
	
	//  box animation
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:3];
	[UIView setAnimationRepeatCount:100];
	[UIView setAnimationRepeatAutoreverses:YES];
	box.backgroundColor = [UIColor yellowColor];
	CGPoint point = box.center;
	point.y -=200;
	box.center = point;
	[UIView commitAnimations];
		
	// create box1 
	UIView *box1 = [[UIView alloc] initWithFrame:CGRectMake(135, 200, 50, 50)];
	box1.backgroundColor = [UIColor redColor];
	[self.window.rootViewController.view addSubview:box1];
	
	// box1 animation
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:3];
	[UIView setAnimationRepeatCount:100];
	[UIView setAnimationRepeatAutoreverses:YES];
	box1.backgroundColor = [UIColor yellowColor];
	CGPoint point1 = box1.center;
	point1.y +=210;
	box1.center = point1;
	[UIView commitAnimations];
	
	// create box2
	UIView *box2 = [[UIView alloc] initWithFrame:CGRectMake(135, 200, 50, 50)];
	box2.backgroundColor = [UIColor redColor];
	[self.window.rootViewController.view addSubview:box2];
	
	// box2 animation
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:3];
	[UIView setAnimationRepeatCount:100];
	[UIView setAnimationRepeatAutoreverses:YES];
	box2.backgroundColor = [UIColor yellowColor];
	CGPoint point2 = box2.center;
	point2.x -= 135;
	box2.center = point2;
	[UIView commitAnimations];
	
	// create box3
	UIView *box3 = [[UIView alloc] initWithFrame:CGRectMake(135, 200, 50, 50)];
	box3.backgroundColor = [UIColor redColor];
	[self.window.rootViewController.view addSubview:box3];
	
	// box3 animation
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:3];
	[UIView setAnimationRepeatCount:100];
	[UIView setAnimationRepeatAutoreverses:YES];
	box3.backgroundColor = [UIColor yellowColor];
	CGPoint point3 = box3.center;
	point3.x += 135;
	box3.center = point3;
	[UIView commitAnimations];
	
	
	
	

	
	
	
    
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
