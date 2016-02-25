//
//  AppDelegate.h
//  许波波
//
//  Created by alan on 15/9/16.
//  Copyright (c) 2015年 alan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomStatusBar.h"
#import "ASIDownloadCache.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    ASIDownloadCache * myCache;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) ASIDownloadCache *myCache;

@end

