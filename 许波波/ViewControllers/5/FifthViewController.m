//
//  FifthViewController.m
//  许波波
//
//  Created by alan on 15/9/16.
//  Copyright (c) 2015年 alan. All rights reserved.
//

#import "FifthViewController.h"

@interface FifthViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView * myTableView;
    UIImageView * _imageView;
}

@end

@implementation FifthViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
//    _imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Icon"]];
//    _imageView.center=self.view.center;
//    [self.view addSubview:_imageView];
    //获得全局的并发队列
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nstimerStart) userInfo:nil repeats:YES];
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //添加任务到队列中，就可以执行任务
//    dispatch_async(queue, ^{
//        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nstimerStart) userInfo:nil repeats:YES];
////        [NSTimer timerWithTimeInterval:1 target:self selector:@selector(nstimerStart) userInfo:nil repeats:YES];
//    });
    // Do any additional setup after loading the view.
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height-64)];
    myTableView.backgroundColor = [UIColor grayColor];
    myTableView.dataSource  = self;
    myTableView.delegate = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTableView];
}
- (void)nstimerStart
{
   
    if (_imageView.center.x > self.view.frame.size.width) {
         _imageView.center=CGPointMake(160,self.view.center.y);
    }
    CGPoint location = CGPointMake(_imageView.center.x+10,_imageView.center.y);
    [UIView animateWithDuration:5.0 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        _imageView.center = location;
    } completion:^(BOOL finished) {
        NSLog(@"yes");
    }];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = touches.anyObject;
    CGPoint location = [touch locationInView:self.view];
    [UIView animateWithDuration:5.0 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        _imageView.center = location;
    } completion:^(BOOL finished) {
        NSLog(@"yes");
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        CALayer * layer1 = [[CALayer alloc] init];
        layer1.bounds = CGRectMake(0, 0, 40, 40);
        layer1.position = CGPointMake(40, 30);
        layer1.contents = (id)[UIImage imageNamed:@"Icon"].CGImage;
        layer1.delegate = self;
        [cell.layer addSublayer:layer1];
        CALayer * layer2 = [[CALayer alloc] init];
        layer2.bounds = CGRectMake(50, 0, 40, 40);
        layer2.position = CGPointMake(90, 30);
        layer2.contents = (id)[UIImage imageNamed:@"Icon"].CGImage;
        layer2.delegate = self;
        [cell.layer addSublayer:layer2];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return cell;
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
