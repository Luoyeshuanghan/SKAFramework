//
//  ViewController.m
//  SKAFramework
//
//  Created by JYC on 2017/4/24.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Route.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"1");
    
    [self.view SKA_bg:[UIColor whiteColor]];
    
    UITextField * tf = ({
        UITextField * t = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 175, 40)];
        t.backgroundColor = [UIColor orangeColor];
        [t SKA_addLeftIcon:@"T"];
        t;
    });
    
    [self.view addSubview:tf];
    
    UIButton * btn = ({
        UIButton * bn = [UIButton SKA_initAR:200 y:200 w:80 h:50];
        [bn SKA_bg:[UIColor yellowColor]];
        [bn SKA_action:self action:@selector(abcde)];
        bn;
    });
    [self.view addSubview:btn];
    
    [self.navigationController SKA_navigationBarBg:@"General_navi_bg"];
}

- (void)sss{
    [self.view endEditing:YES];
}
- (void)abcde{
    [self SKA_push:@"AC" param:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
