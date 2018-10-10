//
//  SecondViewController.m
//  barItemExpand
//
//  Created by 岳重亮 on 2018/10/10.
//  Copyright © 2018年 ycl. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"测试";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 34, 44);
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    leftButton.backgroundColor = [UIColor redColor];
    [leftButton setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItems = @[leftItem];
}

- (void)popAction:(UIButton *)button{
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
