//
//  UIView+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/4/24.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "UIView+SKA.h"

@implementation UIView (SKA)
@dynamic screenViewX, screenViewY;
+ (instancetype)SKA_initAR:(float)x y:(float)y w:(float)w h:(float)h{
    return [[self alloc] initWithFrame:CGRectMake(SKAW(x), SKAH(y), SKAW(w), SKAH(h))];
}

+ (instancetype)SKA_initR:(float)x y:(float)y w:(float)w h:(float)h{
    return [[[self alloc] initWithFrame:CGRectMake(x, y, w, h)] init];
}

- (void)SKA_bg:(UIColor *)color{
    self.backgroundColor = color;
}
- (void)SKA_circle{
    [self SKA_layerRadius:self.SKA_w/2];
}
- (void)SKA_ellipse{
    [self SKA_layerRadius:self.SKA_h/2];
}
- (void)SKA_layerRadius:(float)radius{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
}
- (void)SKA_layerBorder:(UIColor *)border_color width:(float)border_width{
    self.layer.borderColor = border_color.CGColor;
    self.layer.borderWidth = border_width;
}
- (CGFloat)SKA_x{
    return self.frame.origin.x;
}
- (void)setSKA_x:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)SKA_y{
    return self.frame.origin.y;
}
- (void)setSKA_y:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)SKA_w{
    return self.frame.size.width;
}
- (void)setSKA_w:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)SKA_h{
    return self.frame.size.height;
}
- (void)setSKA_h:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)SKA_right{
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setSKA_right:(CGFloat)r{
    CGRect frame = self.frame;
    frame.origin.x = r - frame.size.width;
    self.frame = frame;
}
- (CGFloat)SKA_bottom{
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setSKA_bottom:(CGFloat)bottom{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)SKA_screenViewX{
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.SKA_x;
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    return x;
}
- (CGFloat)SKA_screenViewY{
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.SKA_y;
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}
- (CGFloat)SKA_th{
    return self.SKA_y + self.SKA_h;
}
- (CGFloat)SKA_lw{
    return self.SKA_x + self.SKA_w;
}
- (void)SKA_addSV:(UIView *)view, ...{
    id eachObject;
    va_list argumentList;
    if (view){
        [self addSubview:view];
        @try {
            va_start(argumentList, view);
            while ((eachObject = va_arg(argumentList, id))){
                [self addSubview:eachObject];
            }
            va_end(argumentList);
        } @catch (NSException *exception) {
            
        }
    }
}
- (void)SKA_removeAllSubviews{
//    [self.subviews makeObjectsPerformSelector:@selector(SKA__removeAllSubViews)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}
- (void)SKA_vshadow:(CGSize)size color:(UIColor *)shadow_color{
    self.layer.shadowOffset = size;
    self.layer.shadowColor = shadow_color.CGColor;
}
@end
