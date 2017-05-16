//
//  SKAAlertSheet.m
//  SKAFramework
//
//  Created by JYC on 2017/4/24.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "SKAAlertSheet.h"

@implementation SKAAlertSheet
+ (void)test:(id)delegate confirm:(void (^)(void))confirm cancel:(void (^)(void))cancel{
    UIAlertController *sheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [sheetController addAction:[self SKA_addGeneralAction:@"确定吧" act:confirm]];
    [sheetController addAction:[self SKA_addCancelAction:@"取消吧" act:cancel]];
    [delegate presentViewController:sheetController animated:YES completion:nil];
}

+ (UIAlertAction *)SKA_addGeneralAction:(NSString *)title act:(void (^)(void))act{
    UIAlertAction * alert_action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        act();
    }];
    [alert_action setValue:SKAAlertSheetGeneralColor forKey:@"_titleTextColor"];
    return alert_action;
}
+ (UIAlertAction *)SKA_addCancelAction:(NSString *)title act:(void (^)(void))act{
    UIAlertAction * cancel_action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        act();
    }];
    [cancel_action setValue:SKAAlertSheetCancelColor forKey:@"_titleTextColor"];
    return cancel_action;
}
@end
