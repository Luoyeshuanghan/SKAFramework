//
//  SKAVHeader.h
//  SKAFramework
//
//  Created by JYC on 2017/4/24.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#ifndef SKAVHeader_h
#define SKAVHeader_h

#pragma mark - 定义
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SKAW(X) (X)*(SCREEN_WIDTH/375.0)
#define SKAH(Y) (Y)*(SCREEN_HEIGHT/667.0)
#define SKAF(S) SCREEN_WIDTH == 375.0 ? S : SCREEN_WIDTH == 414.0 ? S + 1 : S - 1
#define SKAK(num1, num2, num3) SCREEN_WIDTH == 375.0 ? num2 : SCREEN_WIDTH == 414.0 ? num3 : num1

#pragma mark - BASE
#import "SKABaseView.h"

#pragma mark - UI
#import "UIView+SKA.h"
#import "UIButton+SKA.h"
#import "UILabel+SKA.h"
#import "UITextView+SKA.h"
#import "UITextField+SKA.h"
#import "UIImageView+SKA.h"
#import "UINavigationController+SKA.h"

#pragma mark - SKAUI
#import "SKAAlertController.h"

#endif /* SKAVHeader_h */
