//
//  BirdsMasterViewController.h
//  BirdWatchingII
//
//  Created by Seth Vernon on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BirdSightingDataController;

@interface BirdsMasterViewController : UITableViewController

@property(strong, nonatomic)BirdSightingDataController *dataController;

@end
