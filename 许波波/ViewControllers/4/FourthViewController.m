//
//  FourthViewController.m
//  许波波
//
//  Created by alan on 15/9/16.
//  Copyright (c) 2015年 alan. All rights reserved.
//

#import "FourthViewController.h"
#import "XVAvatarBrowser.h"
#import "XuanZhuanView.h"
#import "Person.h"
@interface FourthViewController ()
{
    XuanZhuanView * image;
    Person * xiaoMing;
}

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    xiaoMing = [[Person alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
/*
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithTitle:@"开始" style:UIBarButtonItemStylePlain target:self action:@selector(begin)];
    self.navigationItem.leftBarButtonItem = left;
    image = [[XuanZhuanView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    image.center = self.view.center;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    imageView.backgroundColor = [UIColor blackColor];
    imageView.image = [UIImage imageNamed:@"视频准备中"];
    [image addSubview:imageView];
    [image start];
    [self.view addSubview:image];
    self.view.backgroundColor = [UIColor blackColor];
 */
}
- (void)answer
{
    unsigned int count = 0;
//    xiaoMing.nameString = @"xiaoming";
    NSLog(@"%@",xiaoMing.nameString);
    
    Ivar * ivar = class_copyIvarList([xiaoMing class], &count);
    for (int i =0 ; i< count; i++) {
        Ivar var = ivar[i];
        const char * varName = ivar_getName(*ivar);
        NSString * name = [NSString stringWithUTF8String:varName];
        if ([name isEqualToString:@"_nameString"]) {
            object_setIvar(xiaoMing, var, @"xiaohong");
            break;
        }
    }
    NSLog(@"xiaoMing name is %@",xiaoMing.nameString);
    Method m1 = class_getInstanceMethod([xiaoMing class], @selector(firstSay));
    Method m2 = class_getInstanceMethod([xiaoMing class], @selector(secondSay));
    method_exchangeImplementations(m1, m2);
    [xiaoMing firstSay];//调用第一次回答，实际调用的是第二次回答（交换了方法一和方法二）
    class_addMethod([xiaoMing class], @selector(guess), (IMP)guessAnswer, "v@:");
    if ([xiaoMing respondsToSelector:@selector(guess)]) {
        [xiaoMing performSelector:@selector(guess)];
    }else{
        NSLog(@"Sorry,I dont'n know");
    }
    
}
void guessAnswer(id self, SEL _cmd){
    NSLog(@"He is from guangtong");
}
- (void)begin{
    [image stop];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [image start];
}
- (void)imageViewAction
{
//    UIImageView * image = (UIImageView*)[self.view viewWithTag:1908];
//    [XVAvatarBrowser showImage:image withBeishu:100];
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
