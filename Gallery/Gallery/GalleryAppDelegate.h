//
//  GalleryAppDelegate.h
//  Gallery
//
//  Created by Seth Vernon on 11/27/12.
//  Copyright (c) 2012 Seth Vernon All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GalleryAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;



@end
