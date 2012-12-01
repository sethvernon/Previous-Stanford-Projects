//
//  GalleryAppDelegate.h
//  Gallery
//
//  Created by Seth Vernon on 11/27/12.
//  Copyright (c) 2012 Seth Vernon All rights reserved.
//

#import <Cocoa/Cocoa.h>


@class CBMainWindow;
@class CBAlbum;

@interface GalleryAppDelegate : NSObject

@property (retain)CBMainWindow *mainWindow;
@property (retain)CBMainWindow *mainWindowController;
@property (retain)CBAlbum *selectedAlbum;


- (IBAction)newAlbum:(id)sender;

// Provided by template
@property (nonatomic, retain) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;



@end
