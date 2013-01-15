//
//  BirdsDetailViewController.h
//  BirdWatchingII
//
//  Created by Seth Vernon on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BirdSighting;

@interface BirdsDetailViewController : UITableViewController

@property (strong, nonatomic)BirdSighting *sighting;
@property (weak, nonatomic)IBOutlet UILabel *birdNameLabel;
@property (weak, nonatomic)IBOutlet UILabel *locationLabel;
@property (weak, nonatomic)IBOutlet UILabel *dateLabel;

@end
