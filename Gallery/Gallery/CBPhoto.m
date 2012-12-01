//
//  CBPhoto.m
//  Gallery
//
//  Created by Cara Ellis on 11/29/12.
//  Copyright (c) 2012 Cara Ellis. All rights reserved.
//

#import "CBPhoto.h"
#import <Quartz/Quartz.h>

@interface CBPhoto ()
@property (retain) NSImage *thumbnail;
- (void) generateUniqueID;
@end

@implementation CBPhoto

// use 'dynamic' for Core Data properties.
@dynamic filePath;
@dynamic uniqueID;
@dynamic orderIndex;
@dynamic album;

// use 'synthesize' for normal properties.
@synthesize thumbnail;

+ (id) photoInDefaultContext
{
    NSManagedObjectContext *context = [[NSApp delegate] managedObjectContext];
    
    CBPhoto *newItem;
    newItem = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:context];
    
    newItem.filePath = nil;
    
    return newItem;
}


- (NSImage *) largeThumbnail
{
    // 'largeThumbnail' is used by the list view.
    
    if (self.thumbnail) return self.thumbnail;
    
    NSSize          size = NSMakeSize(250, 250);
    CFStringRef     path = (__bridge CFStringRef) self.filePath;
    CFURLRef        url  = CFURLCreateWithFileSystemPath(NULL, path, kCFURLHFSPathStyle, NO);
    
    // use QuickLook to generate a thumbnail of the image.
    CGImageRef  thumb = QLThumbnailImageCreate(NULL, url, size, nil);
    NSImage *image    = [[NSImage alloc] initWithCGImage:thumb size:size];
    self.thumbnail = image;
    
    return image;
}


#pragma mark -
#pragma mark Core Data Methods

- (void) awakeFromInsert
{
    // called when the object is first created.
    [self generateUniqueID];
}


#pragma mark -
#pragma 'IKImageBrowserItem' Protocol Methods


- (NSString *) imageTitle
{
    NSString *fullFileName = self.filePath.lastPathComponent;
    return [fullFileName stringByDeletingPathExtension];
}


- (NSString *) imageUID
{
    // return uniqueID if it exists.
    NSString *uniqueID = self.uniqueID;
    if (uniqueID) return uniqueID;
    [self generateUniqueID];
    return self.uniqueID;
    
}


- (NSString *) imageRepresentationType
{
    return IKImageBrowserPathRepresentationType;
}



- (id) imageRepresentation
{
    return self.filePath;
}

#pragma mark -
#pragma mark Private

- (void) generateUniqueID
{
    NSString *uniqueID = self.uniqueID;
    if (uniqueID != nil) return;
    self.uniqueID = [[NSProcessInfo processInfo] globallyUniqueString];

}


@end













