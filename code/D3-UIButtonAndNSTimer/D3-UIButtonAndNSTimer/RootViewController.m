//
//  RootViewController.m
//  D3-UIButtonAndNSTimer
//
//  Created by Jerry on 15/11/3.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    NSTimer *_timer;
}
@end

@implementation RootViewController

- (void)dealloc
{
    //定时器是用类方法创建的，取消释放，但是需要禁用
    if (_timer.isValid) {
        //让定时器失效
        [_timer invalidate];
    }
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTimer];
    [self createButton];
    [self practiceTip];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTimer
{
    /*创建定时器，默认处于开启状态
     1:时间间隔
     2:处理对象
     3:如何处理
     4:用户信息
     5:是否重复
     */
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeColor:) userInfo:nil repeats:YES];
    //关闭定时器
    [_timer setFireDate:[NSDate distantFuture]];
}

- (void)changeColor:(NSTimer *)timer
{
#define Random  arc4random()%256/255.0
    self.view.backgroundColor = [UIColor colorWithRed:Random green:Random blue:Random alpha:1.0];
}

- (void)createButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 150, self.view.frame.size.width-200, 100);
    [button setTitle:@"开始" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:50];
    [button addTarget:self action:@selector(changeStatus:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)changeStatus:(UIButton *)button
{
    NSString *title = button.currentTitle;
    if ([title isEqualToString:@"开始"]) {
        [button setTitle:@"暂停" forState:UIControlStateNormal];
        //将定时器的开启时间设置为很久以前的时间会开启定时器
        [_timer setFireDate:[NSDate distantPast]];
    } else {
        [button setTitle:@"开始" forState:UIControlStateNormal];
        //将定时器的开启时间设置为将来的一个时间会关闭定时器
        [_timer setFireDate:[NSDate distantFuture]];
    }
}

- (void)practiceTip
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 50, 50);
    label.backgroundColor = [UIColor blueColor];
    label.tag = 250;
    [self.view addSubview:[label autorelease]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(self.view.frame.size.width-50, 0, 50, 50);
    button.backgroundColor = [UIColor yellowColor];
    button.showsTouchWhenHighlighted = YES;
    [button addTarget:self action:@selector(moveLabel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)moveLabel
{
    UILabel *label = (UILabel *)[self.view viewWithTag:250];
    CGRect frame = label.frame;
    frame.origin.x += 10;
    frame.origin.y += 20;
    label.frame = frame;
}

@end
