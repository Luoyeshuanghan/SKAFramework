//
//  SKAAlertController.m
//  SKAFramework
//
//  Created by JYC on 2017/4/24.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "SKAAlertController.h"

@implementation SKAAlertController

#pragma mark - Base
+ (void)SKAAlertControllerStyle:delegate alert_title:(NSString *)alert_title block_1:(void (^)(void))block_1 block_1_title:(NSString *)block_1_title block_2:(void (^)(void))block_2 block_2_title:(NSString *)block_2_title{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:alert_title message:@"" preferredStyle:UIAlertControllerStyleAlert];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = SKAH(5);
    paragraphStyle.alignment = NSTextAlignmentLeft;
    NSMutableAttributedString * s_title = [[NSMutableAttributedString alloc] initWithString:alert_title];
    [s_title addAttribute:NSFontAttributeName value:SKAAlertControllerTitleFont range:NSMakeRange(0, [[s_title string] length])];
    [s_title addAttribute:NSForegroundColorAttributeName value:SKAAlertControllerTitleColor range:NSMakeRange(0, [[s_title string] length])];
    [s_title addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [[s_title string] length])];
    [alertController setValue:s_title forKey:@"attributedTitle"];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:block_1_title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block_1();
    }];
    [cancelAction setValue:SKAAlertControllerCancelColor forKey:@"_titleTextColor"];
    
    UIAlertAction * changeAction = [UIAlertAction actionWithTitle:block_2_title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block_2();
    }];
    [changeAction setValue:SKAAlertControllerConfirmColor forKey:@"_titleTextColor"];
    
    [alertController addAction:cancelAction];
    [alertController addAction:changeAction];
    
    [delegate presentViewController:alertController animated:YES completion:nil];
}
@end
