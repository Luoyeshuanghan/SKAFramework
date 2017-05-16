//
//  UITextView+SKA.h
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (SKA)
- (void)SKA_fs:(float)size;
- (void)SKA_textColor:(UIColor *)color;
- (void)SKA_leftAlign;
- (void)SKA_centerAlign;
- (void)SKA_rightAlign;
- (void)SKA_lineHeight:(float)height;
- (void)SKA_placeHolder:(NSString *)text;
@end
