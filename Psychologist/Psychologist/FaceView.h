//
//  FaceView.h
//  Happiness
//
//  Created by Seth Vernon on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FaceView;

@protocol FaceViewDataSource
- (float)smileForFaceView:(FaceView *)sender;
@end

@interface FaceView : UIView

@property (nonatomic) CGFloat scale;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@property (nonatomic, weak) IBOutlet id <FaceViewDataSource> dataSource;

@end
