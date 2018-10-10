//
//  FirstViewController.m
//  barItemExpand
//
//  Created by 岳重亮 on 2018/10/10.
//  Copyright © 2018年 ycl. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *pushBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 100, 30)];
    [pushBtn setTitle:@"跳转" forState:UIControlStateNormal];
    pushBtn.backgroundColor = [UIColor redColor];
    [pushBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
}

- (void)pushAction:(UIButton *)button{
    
    SecondViewController *sendVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:sendVC animated:YES];
}

@end
