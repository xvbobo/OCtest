//
//  SecondViewController.m
//  许波波
//
//  Created by alan on 15/9/16.
//  Copyright (c) 2015年 alan. All rights reserved.
//

#import "SecondViewController.h"
#define UIScreenWith self.view.frame.size.width
#define UIScreenHeight self.view.frame.size.height
@interface SecondViewController ()
{
    UIImageView * pointView;
    NSTimer * time;
    CGFloat numbel;
    int (^square)(int);
    UIImageView * textView;
    UIButton * changeBtn;
    
}

@end
void myFunction(int (^mySquare)(int));
@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Block];
    numbel = 0;
    textView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,UIScreenWith/2, UIScreenHeight/2)];
    textView.center = self.view.center;
    textView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:textView];
    changeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    changeBtn.frame = CGRectMake(10, 70, 60, 40);
    changeBtn.backgroundColor = [UIColor grayColor];
    [changeBtn setTitle:@"改变" forState:UIControlStateNormal];
    [changeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [changeBtn addTarget:self action:@selector(changeUIView) forControlEvents:UIControlEventTouchUpInside];
//    [changeBtn addTarget:self action:@selector(changeUIView) forControlEvents:UIControlEventTouchUpInside];
    [changeBtn addTarget:self action:@selector(changeUIView2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeBtn];
   
   
    // Do any additional setup after loading the view.
}
- (void)changeUIView2
{//连续动画:一个接一个地显示一系列的图像
    NSArray * myImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"引导页-1新苹果"],[UIImage imageNamed:@"引导页-2新苹果"],[UIImage imageNamed:@"引导页-3新苹果"],[UIImage imageNamed:@"引导页-4新苹果"],[UIImage imageNamed:@"引导页-5新苹果"], nil];
    textView.animationImages = myImages;
    textView.animationDuration = 2;//浏览整个图片一次所用的时间
    textView.animationRepeatCount = 1; //0 = loops forever 动画重复次数
    [textView startAnimating];
}
- (void)changeUIView1
{//旋转
    numbel++;
    CGAffineTransform tansform = CGAffineTransformMakeRotation(M_PI/numbel);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationRepeatCount:10];
    textView.transform = tansform;
    [UIView commitAnimations];
}
- (void)changeUIView
{
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(change) userInfo:nil repeats:YES];
    //翻转动画
    //开始动画
    [UIView beginAnimations:@"animation" context:nil];
   
    //设置时常
    [UIView setAnimationDuration:3.0];
    //设置动画淡入淡出
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
     [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    //设置代理
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatCount:4];
    [UIView setAnimationDidStopSelector:@selector(change)];
    textView.alpha = 0.0;
    //设置翻转方向
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:textView cache:NO];
    
    //Commit the changes and perform the animation.
    [UIView commitAnimations];
   
}
- (void)change
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:3.0];
    [UIView setAnimationDelay:2.0];
    textView.alpha = 1.0;
    [UIView commitAnimations];
}
- (void)Block
{
    square = ^(int a){
        return a*a;
    };
    int result = square(6);
    NSLog(@"%d",result);
    self.view.backgroundColor = [UIColor whiteColor];
    
    int (^mySquare)(int) = ^(int a){
        return a * a;
    };
    //    mySquare(6);
    //    myFunction(mySquare);
    void(^printfBlock)() = ^(){
        int a = 5;
        int b = 6;
        NSLog(@"%d",a * b );
    };
    printfBlock();
    //    printfBlock(9);
    int mutiplier = 7;
    int (^myBlock)(int) = ^(int num){
        return num * mutiplier;
    };
    int newMutiplier = myBlock(3);//21
    NSLog(@"%d",newMutiplier);
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
