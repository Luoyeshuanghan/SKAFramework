//
//  SKAAlertSheet.h
//  SKAFramework
//
//  Created by JYC on 2017/4/24.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SKAAlertSheetGeneralColor [UIColor blackColor]
#define SKAAlertSheetCancelColor [UIColor grayColor]

@interface SKAAlertSheet : NSObject
+ (void)test:(id)delegate confirm:(void (^)(void))confrim cancel:(void (^)(void))cancel;
@end
