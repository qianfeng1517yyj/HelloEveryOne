//
//  RootViewController.m
//  D2-UIButtonAndUILabel
//
//  Created by Jerry on 15/11/3.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "RootViewController.h"

#define VIEW_WIDTH self.view.frame.size.width

@interface RootViewController ()
{
    int _number;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addEventOne];
    [self addEventTwo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addEventOne
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = CGRectMake(100, 50, VIEW_WIDTH-200, 100);
    button.backgroundColor = [UIColor greenColor];
    button.showsTouchWhenHighlighted = YES;
    
    [button setTitle:@"开始" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:50];
    
    [button addTarget:self action:@selector(changeTitle:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)changeTitle:(UIButton *)button
{
    static BOOL flag = NO;
    
    [button setTitle:(flag==NO)?@"暂停":@"开始" forState:UIControlStateNormal];

    flag = !flag;
}

- (void)addEventTwo
{
    //创建label
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 200, VIEW_WIDTH-200, 50);
    label.backgroundColor = [UIColor blueColor];
    label.text = @"0";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:50];
    label.textColor = [UIColor whiteColor];
    label.tag = 250;
    [self.view addSubview:[label autorelease]];
    
    //创建button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 300, VIEW_WIDTH-200, 100);
    button.backgroundColor = [UIColor redColor];
    button.showsTouchWhenHighlighted = YES;
    button.layer.cornerRadius = 20;
    
    [button addTarget:self action:@selector(addNumber:) forControlEvents:UIControlEventTouchUpInside];
    
    [button addTarget:self action:@selector(clearNumber:) forControlEvents:UIControlEventTouchUpOutside];
    
    [self.view addSubview:button];
}

- (void)addNumber:(UIButton *)button
{
    _number++;
    
    UILabel *label = (UILabel *)[self.view viewWithTag:250];
    label.text = [NSString stringWithFormat:@"%d", _number];
}

- (void)clearNumber:(UIButton *)button
{
    _number = 0;
    
    UILabel *label = (UILabel *)[self.view viewWithTag:250];
    label.text = @"0";
}

@end
