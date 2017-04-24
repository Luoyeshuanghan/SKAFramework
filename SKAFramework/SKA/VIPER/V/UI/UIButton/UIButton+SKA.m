//
//  UIButton+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/4/24.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "UIButton+SKA.h"

@implementation UIButton (SKA)
#pragma mark - Lazy
- (void)SKA_title:(NSString *)title{
    [self setTitle:title forState:UIControlStateNormal];
}
- (void)SKA_textColor:(UIColor *)color{
    [self setTitleColor:color forState:UIControlStateNormal];
}
- (void)SKA_textSize:(CGFloat)size{
    self.titleLabel.font = [UIFont systemFontOfSize:size];
}
- (void)SKA_image:(UIImage *)image{
    [self setImage:image forState:UIControlStateNormal];
}
- (void)SKA_imageNamed:(NSString *)imageNamed{
    [self setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateHighlighted];
}
- (void)SKA_bgImage:(NSString *)image{
    [self setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
}
- (void)SKA_action:(id)target action:(SEL)action{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
- (void)SKA_leftAlign{
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
}
- (void)SKA_centerAlign{
    self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
}
- (void)SKA_textMarginLeft:(CGFloat)left{
    self.contentEdgeInsets = UIEdgeInsetsMake(0, left, 0, 0);
}
- (void)SKA_textMarginTop:(CGFloat)top{
    self.contentEdgeInsets = UIEdgeInsetsMake(top, 0, 0, 0);
}
@end
