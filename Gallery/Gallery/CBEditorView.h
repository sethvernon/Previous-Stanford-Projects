//
//  CBEditorView.h
//  Gallery
//
//  Created by Seth A. Vernon on 11/29/12.
//  Copyright (c) 2012 Seth A. Vernon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@class CBMainWindow;
@class CBPhoto;

@interface CBEditorView : NSViewController

@property (assign) CBMainWindow *mainWindowController;
@property (retain) IBOutlet IKImageView *imageView;

- (void) editPhoto: (CBPhoto *)photo;

@end
