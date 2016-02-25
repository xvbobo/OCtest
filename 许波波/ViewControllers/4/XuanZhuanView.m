//
//  XuanZhuanView.m
//  许波波
//
//  Created by alan on 16/1/18.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "XuanZhuanView.h"

@implementation XuanZhuanView
- (void)start
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 2;//单次重复的时间
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 3;//重复的次数
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];

}
- (void)stop
{
    [self.layer removeAllAnimations];
}


@end
