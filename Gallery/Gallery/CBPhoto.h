//
//  CBPhoto.h
//  Gallery
//
//  Created by Seth A. Vernon on 11/29/12.
//  Copyright (c) 2012 Seth A. Vernon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "CBAlbum.h"

@class album;

@interface CBPhoto : NSManagedObject

// attributes.
@property (retain) NSString *filePath;
@property (retain) NSString *uniqueID;
@property (retain) NSNumber *orderIndex;

// relationships.
@property (strong) CBAlbum *album;

// non-modeled properties.
@property (readonly) NSImage *largeThumbnail;

// methods.
+ (id) photoInDefaultContext;


@end
