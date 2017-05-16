//
//  UIViewController+SKANetInterfactor.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/12/7.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "UIViewController+SKANetInterfactor.h"
//#import "SKALoginNavi.h"
//#import "SKAFirstPerfectPersonalData1C.h"
//#import "SKAAlertControllerBIZ.h"

@implementation UIViewController (SKANetInterfactor)
//info不为空时弹出提示
- (void)netWork_s200:(NSString *)info{
//    [SKAHUD warningProgress:info];
}
//未登录
- (void)netWork_s201:(NSString *)info{
//    [SKAHUD dismissProgress];
//    if (![info isEqualToString:@""]){
//        [SKAHUD warningProgress:info];
//    }
//    [[AppDelegate sharedApplication].window setRootViewController:[SKALoginNavi new]];
//    [SKAUser logOut];
}
//错误时弹出info提示
- (void)netWork_s500:(NSString *)info{
//    [SKAHUD dismissProgress];
//    [SKAHUD warningProgress:info];
}
//未填写资料
- (void)netWork_s202:(NSString *)info{
//    [SKAHUD dismissProgress];
//    if (![info isEqualToString:@""]){
//        [SKAHUD warningProgress:info];
//    }
//    [SKAAlertControllerBIZ biz_202_alert:self logout_block:^{
//        [self presentViewController:[SKAFirstPerfectPersonalData1C new] animated:YES completion:^{
//            [self SKA_back];
//        }];
//    }];
}
@end
