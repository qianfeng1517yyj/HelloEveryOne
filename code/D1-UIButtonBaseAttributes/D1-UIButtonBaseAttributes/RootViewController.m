//
//  RootViewController.m
//  D1-UIButtonBaseAttributes
//
//  Created by Jerry on 15/11/3.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "RootViewController.h"

#define VIEW_WIDTH self.view.frame.size.width

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //测试按钮风格
    [self buttonStyle];
    //测试基本属性
    [self baseAttributes];
    //测试图片边界
    [self iconAndEdge];
    //添加事件
    [self addEvent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonStyle
{
    /*按钮风格
     UIButtonTypeCustom
     UIButtonTypeSystem
     //详情
     UIButtonTypeDetailDisclosure
     UIButtonTypeInfoLight
     UIButtonTypeInfoDark
     //加号
     UIButtonTypeContactAdd
     UIButtonTypeRoundedRect = UIButtonTypeSystem
     */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(100, 50, VIEW_WIDTH-200, 50);
    button.backgroundColor = [UIColor greenColor];
    //设置着色，会改变系统风格按钮的前景色
    [button setTintColor:[UIColor whiteColor]];
    //设置圆角半径，可以解决7.0之后没有圆角矩形按钮的问题
    button.layer.cornerRadius = 20;
    
    [self.view addSubview:button];
}

- (void)baseAttributes
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 150, VIEW_WIDTH-200, 50);
    button.backgroundColor = [UIColor redColor];
    //设置标题字体(只能设置颜色、字体)
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    //设置标题
    //正常状态
    [button setTitle:@"正常" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    
    //高亮状态
    [button setTitle:@"高亮" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    //高亮状态闪光效果
    button.showsTouchWhenHighlighted = YES;
    
    //禁用状态，button.enabled = NO时有效
    [button setTitle:@"禁用" forState:UIControlStateDisabled];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    //禁用按钮
    //button.enabled = NO;
    
    //选中状态，button.selected = YES时有效
    [button setTitle:@"选中" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    //设置选中
    //button.selected = YES;
    //改变着色，会修改选中状态下的标题背景色
    [button setTintColor:[UIColor clearColor]];
    
    [self.view addSubview:button];
}

- (void)iconAndEdge
{   
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 250, VIEW_WIDTH-200, 200);
    //button.backgroundColor = [UIColor redColor];
    button.showsTouchWhenHighlighted = YES;
    
    //设置指定状态下的背景图，默认填满(大了压缩，小了拉伸)
    [button setBackgroundImage:[UIImage imageNamed:@"start"] forState:UIControlStateNormal];
    
    //设置内容对齐方式
    //水平方向
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //垂直方向
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    
    //设置标题
    [button setTitle:@"标题" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    //必须先让label适应字体才有尺寸
    [button.titleLabel sizeToFit];
    //NSLog(@"titleLabel:%@", NSStringFromCGRect(button.titleLabel.frame));
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //设置图片渲染模式
    UIImage *image = [[UIImage imageNamed:@"webChat"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置前景图标
    [button setImage:image forState:UIControlStateNormal];
    //设置图标边界
    [button setImageEdgeInsets:UIEdgeInsetsMake((button.frame.size.height-image.size.height-button.titleLabel.frame.size.height)/2, (button.frame.size.width-image.size.width)/2, 0, 0)];
    //设置标题边界
    [button setTitleEdgeInsets:UIEdgeInsetsMake((button.frame.size.height+image.size.height-button.titleLabel.frame.size.height)/2, (button.frame.size.width-button.titleLabel.frame.size.width)/2-image.size.width, 0, 0)];
    
    [self.view addSubview:button];
}

- (void)addEvent
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 500, VIEW_WIDTH-200, 100);
    button.backgroundColor = [UIColor blueColor];
    button.showsTouchWhenHighlighted = YES;
    
    /*添加事件
     1:谁来处理
     2:怎么处理
     3:什么事件
     */
    [button addTarget:self action:@selector(buttonHandleOne:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(buttonHandleTwo:) forControlEvents:UIControlEventTouchUpOutside];
    
    [self.view addSubview:button];
}

- (void)buttonHandleOne:(UIButton *)button
{
#define Random arc4random()%256/255.0
    self.view.backgroundColor = [UIColor colorWithRed:Random green:Random blue:Random alpha:1.0];
}

- (void)buttonHandleTwo:(UIButton *)button
{
    self.view.backgroundColor = [UIColor whiteColor];
}

@end







