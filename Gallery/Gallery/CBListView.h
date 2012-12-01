//
//  CBListView.h
//  Gallery
//
//  Created by Cara Ellis on 11/29/12.
//  Copyright (c) 2012 Cara Ellis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@class CBMainWindow;

@interface CBListView : NSViewController

@property (assign) CBMainWindow *mainWindowController;
@property (retain) IBOutlet NSTableView *imagesTable;
@property (retain) IBOutlet NSArrayController *imagesArrayController;

- (IBAction) tableViewItemDoubleClicked:(id)sender;

@end
