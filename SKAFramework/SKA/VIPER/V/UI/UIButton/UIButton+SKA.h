//
//  UIButton+SKA.h
//  SKAFramework
//
//  Created by JYC on 2017/4/24.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SKA)
#pragma mark - Lazy
- (void)SKA_title:(NSString *)title;
- (void)SKA_textColor:(UIColor *)color;
- (void)SKA_textSize:(CGFloat)size;
- (void)SKA_image:(UIImage *)image;
- (void)SKA_imageNamed:(NSString *)imageNamed;
- (void)SKA_bgImage:(NSString *)image;
- (void)SKA_action:(id)target action:(SEL)action;
- (void)SKA_leftAlign;
- (void)SKA_centerAlign;
- (void)SKA_textMarginLeft:(CGFloat)left;
- (void)SKA_textMarginTop:(CGFloat)top;

#pragma mark - Style
typedef enum {
    SKAUIButtonImageFloatLeft,            // imageView在UIButton左边
    SKAUIButtonImageFloatTop,             // imageView在UIButton上面
    SKAUIButtonImageFloatRight,           // imageView在UIButton右边
    SKAUIButtonImageFloatBottom,          // imageView在UIButton下面
} SKAUIButtonImageFloat;
- (void)SKA_imageNamed:(NSString *)imageNamed withImageFloat:(SKAUIButtonImageFloat)imageFloat;
- (void)SKA_imageNamed:(NSString *)imageNamed withImageFloat:(SKAUIButtonImageFloat)imageFloat right_margin:(CGFloat)right_margin;
@end
