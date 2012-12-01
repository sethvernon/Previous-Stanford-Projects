//
//  CBBrowserView.h
//  Gallery
//
//  Created by Seth A. Vernon on 11/28/12.
//  Copyright (c) 2012 Seth A. Vernon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Quartz/Quartz.h>

@class CBMainWindow;

@interface CBBrowserView : NSViewController <NSTableViewDelegate>

// parent window.
@property (assign) CBMainWindow *mainWindowController;

// xib items.
@property (retain) IBOutlet IKImageBrowserView *imageBrowser;
@property (retain) IBOutlet NSTableView *albumsTable;
@property (retain) IBOutlet NSArrayController *albumsArrayController;
@property (retain) IBOutlet NSArrayController *imagesArrayController;

// additional values.
@property (retain) NSArray *imagesSortDescriptors;
@property (assign) CGFloat thumbnailScale;
@property (nonatomic, retain) NSString *file;

@end
