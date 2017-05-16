//
//  AC.m
//  SKAFramework
//
//  Created by JYC on 2017/5/15.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "AC.h"
#import "UIViewController+Route.h"
#import "SKAAlertSheet.h"

@interface AC ()

@end

@implementation AC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view SKA_bg:[UIColor whiteColor]];
    
    UIButton * btn = ({
        UIButton * bn = [UIButton SKA_initAR:200 y:200 w:80 h:50];
        [bn SKA_bg:[UIColor yellowColor]];
        [bn SKA_action:self action:@selector(SKA_back)];
        bn;
    });
    [self.view addSubview:btn];
    
    [self SKA_leftButton:@"T" action:@selector(right1) img2:@"General_pay_icon" action2:@selector(right2) img3:@"General_scan_icon" action3:@selector(right3)];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)right1{
    NSLog(@"1");
}
- (void)right2{
    NSLog(@"2");
    
    [SKAAlertSheet test:self confirm:^{
        NSLog(@"确定了");
    } cancel:^{
        NSLog(@"取消了");
    }];
}
- (void)right3{
    NSLog(@"3");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
