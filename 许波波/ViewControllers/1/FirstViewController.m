//
//  FirstViewController.m
//  许波波
//
//  Created by alan on 15/12/14.
//  Copyright © 2015年 alan. All rights reserved.
//

#import "FirstViewController.h"
#import "DCPicScrollView.h"

@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView * myTableView;
    NSInteger number1;
    NSInteger number2;
}
@end
CGFloat h = 150;
@implementation FirstViewController
+ (void)load
{
    [super load];
    Method formMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method  toMethod = class_getInstanceMethod([self class], @selector(swizzlingViewDidLoad));
    if (!class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(formMethod, toMethod);
    }
    
}
- (void)swizzlingViewDidLoad
{
    NSString *str = [NSString stringWithFormat:@"%@", self.class];
    // 我们在这里加一个判断，将系统的UIViewController的对象剔除掉
    if(![str containsString:@"UI"]){
        NSLog(@"统计打点 : %@", self.class);
    }
    [self swizzlingViewDidLoad];
}

- (void)viewDidLoad {
    number1 = 1;
    number2 = 2;
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notice) name:UIDeviceProximityStateDidChangeNotification object:nil];
    //    [self group2];
    [self create_dispatch_asyn];
    [self createMyTableView];
    [self DrinkBear];//喝啤酒
    //    [self demo1];
    // Do any additional setup after loading the view.
}
/*
 10,5jiu == 5k,5G
 5k = 2jiu 1k = 3k 2g = 1jiu 1k = 1g 0k   ===== 8jiu 8g
 8g = 2jiu = 1k
 
 */
- (void)DrinkBear{
    int kongping = 0;
    int pinjiu = 0;
    int pingGai = 0;
    int hejiping = 0;
    int money = 6;
    kongping = 3;
    pinjiu = 3;
    pingGai = 3;
    hejiping = 3;
    NSLog(@"%d",pinjiu);
}
- (void)create_dispatch_asyn
{
//    dispatch_source_t timer=dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//    
//    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0),0.1*NSEC_PER_SEC,0);
//    
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"wakeup");
//        dispatch_source_cancel(timer);
//    });
//    
//    dispatch_source_set_cancel_handler(timer, ^{
//        NSLog(@"cancel");
////        dispatch_release(timer);
//    });
//    //启动
//    dispatch_resume(timer);
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//    dispatch_source_set_timer(timer,dispatch_time(DISPATCH_TIME_NOW, 15ull*NSEC_PER_SEC),DISPATCH_TIME_FOREVER,1ull*NSEC_PER_SEC);
//    dispatch_source_set_event_handler(timer, ^{
//        number1 ++;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [myTableView reloadData];
//        });
//        NSLog(@"%ld",number1);
//    });
//    dispatch_resume(timer);
    NSTimeInterval period = 1.0; //设置时间间隔
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        //在这里执行事件
        NSLog(@"123");
        
    });
    
    dispatch_resume(_timer);
    
}
- (void)group2
{
    //1. create group
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
//    //2 . create 并发task
//    
//    dispatch_group_enter(group);
//    dispatch_async(q, ^{
//        [NSThread sleepForTimeInterval:1.0];
//        
//        NSLog(@"AAA - %@",[NSThread currentThread]);
//        dispatch_group_leave(group);
//    });
//    dispatch_group_enter(group);
//    dispatch_async(q, ^{
//        [NSThread sleepForTimeInterval:1.5];
//        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer2) userInfo:nil repeats:YES];
//        NSLog(@"BBB - %@",[NSThread currentThread]);
//        dispatch_group_leave(group);
//    });
//    dispatch_group_notify(group,dispatch_get_main_queue(), ^{
//        NSLog(@"over");
//        
//    });
}
- (void)timer1
{
    number1 ++;
}
- (void)timer2
{
    number2 += 2;
}
- (void)notice
{
    if ([UIDevice currentDevice].proximityState) {
        NSLog(@"近距离");
    }else{
        NSLog(@"远距离");
    }
}
- (void)createMyTableView
{
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    myTableView.separatorColor = [UIColor redColor];
    [myTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:myTableView];
}
- (void)demo1 {
    
    //网络加载
    
    
    NSArray *arr = @[@"http://p1.qqyou.com/pic/UploadPic/2013-3/19/2013031923222781617.jpg",
                     @"http://cdn.duitang.com/uploads/item/201409/27/20140927192649_NxVKT.thumb.700_0.png",
                     @"http://img4.duitang.com/uploads/item/201409/27/20140927192458_GcRxV.jpeg",
                     @"http://cdn.duitang.com/uploads/item/201304/20/20130420192413_TeRRP.thumb.700_0.jpeg"];
    
    
    NSArray *arr1 = [@"午夜寂寞 谁来陪我,唱一首动人的情歌.你问我说 快不快乐,唱情歌越唱越寂寞.谁明白我 想要什么,一瞬间释放的洒脱.灯光闪烁 不必啰嗦,我就是传说中的那个摇摆哥.我是摇摆哥 音乐会让我快乐,我是摇摆哥 我已忘掉了寂寞.我是摇摆哥 音乐会让我洒脱,我们一起唱这摇摆的歌" componentsSeparatedByString:@"."];
    
    DCPicScrollView  *picView = [[DCPicScrollView alloc] initWithFrame:CGRectMake(0,64, self.view.frame.size.width, h * 2) WithImageNames:arr];
    
    picView.titleData = arr1;
    picView.placeImage = [UIImage imageNamed:@"place.png"];
    [picView setImageViewDidTapAtIndex:^(NSInteger index) {
        printf("你点到我了😳index:%zd\n",index);
    }];
    //    picView.AutoScrollDelay = 1.0f;
    [self.view addSubview:picView];
    
}
#pragma mark -- 监听事件
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    CGFloat offset = myTableView.contentOffset.y;
    CGFloat delta = offset / 84.f;
    NSLog(@"%f",delta);
    delta = MAX(0, delta);
     NSLog(@"****************%f",delta);
    self.navigationController.navigationBar.alpha = 1- MIN(delta, 1);
    NSLog(@"XXXXXXXXXXXXXXXXXX%f",MIN(delta, 1));
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    if (indexPath.row%2 == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",number2];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",number1];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
