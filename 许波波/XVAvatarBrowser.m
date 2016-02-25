//
//  XVAvatarBrowser.m
//  许波波
//
//  Created by alan on 15/12/29.
//  Copyright © 2015年 alan. All rights reserved.
//

#import "XVAvatarBrowser.h"
static CGRect oldFrame;
static CGPoint oldPonit;
@implementation XVAvatarBrowser
+ (void)showImage:(UIImageView*)avatarImageView withBeishu:(CGFloat) beishu
{
    UIImage * image = avatarImageView.image;
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView * backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    oldFrame = [avatarImageView convertRect:avatarImageView.bounds toView:window];
    oldPonit = avatarImageView.center;
    backgroundView.backgroundColor = [UIColor clearColor];
    backgroundView.alpha=0;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldFrame];
    imageView.image=image;
    imageView.tag=1;
    [backgroundView addSubview:imageView];
    [window addSubview:backgroundView];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer: tap];
    
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame = CGRectMake(0, 0,(int)oldFrame.size.width+beishu,(int)oldFrame.size.height+beishu);
        imageView.center = oldPonit;
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
    
}
+(void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView=tap.view;
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=oldFrame;
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
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
