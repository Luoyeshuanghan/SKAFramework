//
//  SKABaseController.m
//  SKAFramework
//
//  Created by JYC on 2017/5/16.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "SKABaseController.h"

@interface SKABaseController ()

@end

@implementation SKABaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.v = [self presenterInsetView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
