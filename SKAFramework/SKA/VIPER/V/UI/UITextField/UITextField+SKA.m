//
//  UITextField+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "UITextField+SKA.h"

@implementation UITextField (SKA)
- (void)SKA_fs:(CGFloat)size{
    [self setFont:[UIFont systemFontOfSize:size]];
}
- (void)SKA_leftAlign{
    self.textAlignment = NSTextAlignmentLeft;
}
- (void)SKA_centerAlign{
    self.textAlignment = NSTextAlignmentCenter;
}
- (void)SKA_placeholder:(NSString *)placeholder color:(UIColor *)color{
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: color}];
}
- (void)SKA_textColor:(UIColor *)color{
    self.textColor = color;
}
- (void)SKA_setKeyboard:(NSString *)keyboard_type{
    if ([keyboard_type isEqualToString:@"Default"] || [keyboard_type isEqualToString:@"default"]){
        self.keyboardType = UIKeyboardTypeDefault;
    } else if ([keyboard_type isEqualToString:@"Phone"] || [keyboard_type isEqualToString:@"phone"]){
        self.keyboardType = UIKeyboardTypePhonePad;
    } else if ([keyboard_type isEqualToString:@"Number"] || [keyboard_type isEqualToString:@"number"]){
        self.keyboardType = UIKeyboardTypeNumberPad;
    } else if ([keyboard_type isEqualToString:@"Web"] || [keyboard_type isEqualToString:@"web"]){
        self.keyboardType = UIKeyboardTypeURL;
    } else {
        self.keyboardType = UIKeyboardTypeDefault;
    }
}
+ (instancetype)SKA_initField:(float)font_size bg_color:(UIColor *)bg_color text_color:(UIColor *)text_color text_align:(NSTextAlignment)text_align{
    return [self SKA_initField:font_size bg_color:bg_color text_color:text_color text_align:text_align left_padding:0 right_padding:0];
}
+ (instancetype)SKA_initField:(float)font_size bg_color:(UIColor *)bg_color text_color:(UIColor *)text_color text_align:(NSTextAlignment)text_align left_padding:(float)left_padding right_padding:(float)right_padding{
    UITextField * text_field = [UITextField new];
    text_field.font = [UIFont systemFontOfSize:font_size];
    text_field.backgroundColor = bg_color;
    text_field.textColor = text_color;
    text_field.textAlignment = text_align;
    
    UIView * left_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, left_padding, 1)];
    left_view.backgroundColor = [UIColor clearColor];
    text_field.leftView = left_view;
    text_field.leftViewMode = UITextFieldViewModeAlways;
    
    UIView * right_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, right_padding, 1)];
    right_view.backgroundColor = [UIColor clearColor];
    text_field.rightView = right_view;
    text_field.rightViewMode = UITextFieldViewModeAlways;
    
    return text_field;
}
- (void)SKA_addLeftIcon:(NSString *)iconNamed{
    UIImageView * left_view = ({
        UIImageView * iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SKAW(20), SKAH(20))];
        iv.backgroundColor = [UIColor clearColor];
        iv.image = [UIImage imageNamed:iconNamed];
        iv;
    });
    self.leftView = left_view;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)SKA_addRightIcon:(NSString *)iconNamed{
    UIImageView * right_view = ({
        UIImageView * iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SKAW(20), SKAH(20))];
        iv.backgroundColor = [UIColor clearColor];
        iv.image = [UIImage imageNamed:iconNamed];
        iv;
    });
    self.rightView = right_view;
    self.rightViewMode = UITextFieldViewModeAlways;
}
@end
