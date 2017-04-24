//
//  SKAAlertController.h
//  SKAFramework
//
//  Created by JYC on 2017/4/24.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SKAAlertControllerTitleFont [UIFont systemFontOfSize:17]
#define SKAAlertControllerTitleColor [UIColor blackColor]
#define SKAAlertControllerCancelColor [UIColor grayColor]
#define SKAAlertControllerConfirmColor [UIColor blackColor]

@interface SKAAlertController : NSObject
+ (void)SKAAlertControllerStyle:delegate alert_title:(NSString *)alert_title block_1:(void (^)(void))block_1 block_1_title:(NSString *)block_1_title block_2:(void (^)(void))block_2 block_2_title:(NSString *)block_2_title;
@end
