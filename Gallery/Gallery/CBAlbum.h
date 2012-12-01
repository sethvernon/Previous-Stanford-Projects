//
//  CBAlbum.h
//  Gallery
//
//  Created by Seth A. Vernon on 11/29/12.
//  Copyright (c) 2012 Seth A. Vernon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface CBAlbum : NSManagedObject

@property (retain) NSString *title;
@property (retain) NSSet *photos;

+ (id) defaultAlbum;
+ (id) albumInDefaultContext;

@end
