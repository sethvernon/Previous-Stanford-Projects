//
//  CBEditorView.m
//  Gallery
//
//  Created by Seth A. Vernon on 11/29/12.
//  Copyright (c) 2012 Seth A. Vernon. All rights reserved.
//

#import "CBEditorView.h"
#import "CBPhoto.h"
#import "CBMainWindow.h"

@implementation CBEditorView

@synthesize mainWindowController;
@synthesize imageView;


- (void) loadView
{
    [super loadView];
    [self.imageView setImageWithURL:nil];
}


- (void) editPhoto:(CBPhoto *)photo
{
    if (self.view == nil) [self loadView];
    NSURL *url = [NSURL fileURLWithPath:photo.filePath];
    
    [self.imageView setImageWithURL:url];
    [self.mainWindowController activateViewController:self];
}

@end
