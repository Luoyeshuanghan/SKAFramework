//
//  NaviC.m
//  SKAFramework
//
//  Created by JYC on 2017/5/16.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "NaviC.h"

@interface NaviC ()

@end

@implementation NaviC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SKA_setRootViewController:@"ViewController"];
//    [self SKA_navigationBarBg:@"E"];
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