//
//  CBListView.m
//  Gallery
//
//  Created by Cara Ellis on 11/29/12.
//  Copyright (c) 2012 Cara Ellis. All rights reserved.
//

#import "CBListView.h"
#import "CBMainWindow.h"
#import "CBPhoto.h"
#import "CBEditorView.h"

@implementation CBListView

@synthesize mainWindowController;
@synthesize imagesTable;
@synthesize imagesArrayController;

- (void) loadView
{
    [super loadView];
    
    self.imagesTable.target         = self;
    self.imagesTable.doubleAction   = @selector(tableViewItemDoubleClicked:);
}


- (IBAction) tableViewItemDoubleClicked:(id)sender
{
    NSInteger row           = self.imagesTable.clickedRow;
    NSArray *visiblePhotos  = [self.imagesArrayController arrangedObjects];
    CBPhoto *photo          = [visiblePhotos objectAtIndex:row];
    
    CBMainWindow *window = self.mainWindowController;
    id editor = [window viewControllerForName:@"CBEditorView"];
    
    if ([editor isKindOfClass:[CBEditorView class]])
        [(CBEditorView *)editor editPhoto:photo];

}



@end
