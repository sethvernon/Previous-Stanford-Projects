//
//  BirdSighting.m
//  BirdWatchingII
//
//  Created by Seth Vernon on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BirdSighting.h"

@implementation BirdSighting

@synthesize name = _name;
@synthesize location = _location;
@synthesize date = _date;

-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date
{
    self = [super init];
    if (self) {
        _name = name;
        _location = name;
        _date = date;
        return self;
    }
    return nil;
}

@end
