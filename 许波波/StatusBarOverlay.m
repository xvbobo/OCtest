//
//  StatusBarOverlay.m
//  许波波
//
//  Created by alan on 15/12/31.
//  Copyright © 2015年 alan. All rights reserved.
//

#import "StatusBarOverlay.h"

@implementation StatusBarOverlay
@synthesize contentView;
@synthesize textLabel;
- (id)init{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.windowLevel = UIWindowLevelStatusBar;
        self.frame = [UIApplication sharedApplication].statusBarFrame;
        [self setBackgroundColor:[UIColor orangeColor]];
        [self setHidden:NO];
        UIView * _contenView = [[UIView alloc] initWithFrame:self.bounds];
        self.contentView = _contenView;
        [self.contentView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [self.contentView setBackgroundColor:[UIColor grayColor]];
        [self addSubview:self.contentView];
        UILabel *_textLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, CGRectGetWidth(self.frame)-60, CGRectGetHeight(self.frame))];
        self.textLabel = _textLabel;
        [self.textLabel setBackgroundColor:[UIColor blueColor]];
        [self.textLabel setFont:[UIFont systemFontOfSize:12]];
        [self.textLabel setTextAlignment:NSTextAlignmentCenter];
        [self.textLabel setTextColor:[UIColor blackColor]];
        [self.textLabel setText:@"自定义的状态栏 author by jordy"];
        [self.contentView addSubview:self.textLabel];

        [self initializeToDefaultState];
    }
    return self;
    
}
- (void)initializeToDefaultState
{
    CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
    [self rotateStatusBarWithFrame:[NSValue valueWithCGRect:statusBarFrame]];
}
- (void)rotateStatusBarWithFrame:(NSValue *)frameValue
{
     CGRect frame = [frameValue CGRectValue];
     UIInterfaceOrientation orientation = STATUS_BAR_ORIENTATION;
     if (orientation == UIDeviceOrientationPortrait) {
         self.transform = CGAffineTransformIdentity; //屏幕不旋转
          [self setSubViewVFrame];
         }else if (orientation == UIDeviceOrientationPortraitUpsideDown) {
             self.transform = CGAffineTransformMakeRotation(M_PI); //屏幕旋转180度
             [self setSubViewVFrame];
             }else if (orientation == UIDeviceOrientationLandscapeRight) {
                  self.transform = CGAffineTransformMakeRotation((M_PI * (-90.0f) / 180.0f)); //屏幕旋转-90度
                  [self setSubViewHFrame];
                 }else if (orientation == UIDeviceOrientationLandscapeLeft){
                     self.transform = CGAffineTransformMakeRotation(M_PI * 90.0f / 180.0f); //屏幕旋转90度
                     [self setSubViewHFrame];
                 }
    self.frame = frame;
    [self.contentView setFrame:self.bounds];

}
//设置横屏的子视图的frame
- (void)setSubViewHFrame
{
    self.textLabel.frame = CGRectMake(30, 0, 1024-60, 20);
}
//设置竖屏的子视图的frame
- (void)setSubViewVFrame
{
     self.textLabel.frame = CGRectMake(30, 0, 748-60, 20);
}
#pragma mark -
#pragma mark 响应屏幕即将旋转时的事件响应
- (void)willRotateScreenEvent:(NSNotification *)notification
{
    NSValue *frameValue = [notification.userInfo valueForKey:UIApplicationStatusBarFrameUserInfoKey];
     [self rotateStatusBarAnimatedWithFrame:frameValue];
}
 - (void)rotateStatusBarAnimatedWithFrame:(NSValue *)frameValue {
    [UIView animateWithDuration:ROTATION_ANIMATION_DURATION animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
           [self rotateStatusBarWithFrame:frameValue];
         [UIView animateWithDuration:ROTATION_ANIMATION_DURATION animations:^{
            self.alpha = 1;
             }];
        }];
   }
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
