//
//  StatusBarOverlay.h
//  许波波
//
//  Created by alan on 15/12/31.
//  Copyright © 2015年 alan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define STATUS_BAR_ORIENTATION [UIApplication sharedApplication].statusBarOrientation
#define ROTATION_ANIMATION_DURATION [UIApplication sharedApplication].statusBarOrientationAnimationDuration
@interface StatusBarOverlay : UIWindow {
    UIView * contentView;
    UILabel * textLabel;
}
@property (nonatomic, retain) UIView *contentView;
@property (nonatomic, retain) UILabel *textLabel;
- (void)initializeToDefaultState;
- (void)rotateStatusBarWithFrame:(NSValue *)frameValue;
- (void)setSubViewHFrame;
- (void)setSubViewVFrame;
@end
