//
//  MainViewController.m
//  许波波
//
//  Created by alan on 15/9/16.
//  Copyright (c) 2015年 alan. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "CustomStatusBar.h"
#define beijing [UIColor colorWithRed:255 green:97 blue:46 alpha:1]
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSDictionary * dict = [responseObject objcforKey:@"Data"];
//    NSDictionary * dict = [NSDictionary]
//    Data = "{\"CompanyName\":\"ERP\U9884\U89c8\U7248\",\"CompanyNo\":\"15316\",\"LoginDomain\":\"http://www.chnsuper.com:9797/\",\"PageUrl\":\"Handler/Login.ashx\",\"ID\":1,\"UserParam\":\"UserID\",\"PwdParam\":\"Password\",\"SNParam\":\"snList\",\"CheckCodeParam\":\"CheckCode\",\"PageRootUrl\":\"http://www.chnsuper.com:9797/AppWeb/\",\"YG\":\"85895A4F-D72E-4D56-B90E-7C68D32DEE60\",\"UpdateVersionCode\":7}";
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    UIImageView * image = [[UIImageView alloc] initWithFrame:self.view.bounds];
    image.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:image];
    //设置tabBar的背景色
//     [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.tabBar.barTintColor = [UIColor blackColor];
    //设置tabBar按钮被选中的颜色
    self.tabBar.tintColor = [UIColor redColor];
    [self setUpAllChildViewControllers];
    // Do any additional setup after loading the view.
}
- (void)setUpAllChildViewControllers
{
    FirstViewController * oneVC = [[FirstViewController alloc] init];
//    oneVC.view.backgroundColor = [UIColor blueColor];
    [self setUpOneChildViewController:oneVC image:[UIImage imageNamed:@"common_tabbar_mall_icon"] title:@"商城"];
    SecondViewController * twoVC = [[SecondViewController alloc] init];
    [self setUpOneChildViewController:twoVC image:[UIImage imageNamed:@"common_tabbar_mallclassification_icon"] title:@"分类"];
    ThirdViewController * threeVC = [[ThirdViewController alloc] init];
    [self setUpOneChildViewController:threeVC image:[UIImage imageNamed:@"common_tabbar_bubblecircle_icon"] title:@"首页"];
    FourthViewController * fourVC = [[FourthViewController alloc] init];
    [self setUpOneChildViewController:fourVC image:[UIImage imageNamed:@"common_tabbar_shopcart_icon"] title:@"购物车"];
    FifthViewController * fiveVC = [[FifthViewController alloc] init];
    [self setUpOneChildViewController:fiveVC image:[UIImage imageNamed:@"common_tabbar_my_icon"] title:@"我的"];
}
- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage*)image title:(NSString *)title{
    UINavigationController * navC = [[UINavigationController alloc] initWithRootViewController:viewController];
    //设置导航栏字体的颜色，大小
    navC.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont systemFontOfSize:20],UITextAttributeFont, nil];
    navC.title = title;
    navC.tabBarItem.image = image;
    navC.navigationBar.barTintColor = [UIColor orangeColor];
    viewController.navigationItem.title = title;
    [self addChildViewController:navC];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
