//
//  UITextField+SKA.h
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (SKA)
- (void)SKA_fs:(CGFloat)size;
- (void)SKA_leftAlign;
- (void)SKA_centerAlign;
- (void)SKA_placeholder:(NSString *)placeholder color:(UIColor *)color;
- (void)SKA_textColor:(UIColor *)color;
- (void)SKA_setKeyboard:(NSString *)keyboard_type;
+ (instancetype)SKA_initField:(float)font_size bg_color:(UIColor *)bg_color text_color:(UIColor *)text_color text_align:(NSTextAlignment)text_align;
+ (instancetype)SKA_initField:(float)font_size bg_color:(UIColor *)bg_color text_color:(UIColor *)text_color text_align:(NSTextAlignment)text_align left_padding:(float)left_padding right_padding:(float)right_padding;
- (void)SKA_addLeftIcon:(NSString *)iconNamed;
- (void)SKA_addRightIcon:(NSString *)iconNamed;
@end
