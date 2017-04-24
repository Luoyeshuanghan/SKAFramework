//
//  UIView+SKA.h
//  SKAFramework
//
//  Created by JYC on 2017/4/24.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SKA)

@property(nonatomic) CGFloat SKA_x;
@property(nonatomic) CGFloat SKA_y;
@property(nonatomic) CGFloat SKA_w;
@property(nonatomic) CGFloat SKA_h;
@property(nonatomic) CGFloat SKA_right;
@property(nonatomic) CGFloat SKA_bottom;
@property(nonatomic, readonly) CGFloat SKA_th;
@property(nonatomic, readonly) CGFloat SKA_lw;

@property(nonatomic,readonly) CGFloat screenViewX;
@property(nonatomic,readonly) CGFloat screenViewY;

+ (instancetype)SKA_initAR:(float)x y:(float)y w:(float)w h:(float)h;
+ (instancetype)SKA_initR:(float)x y:(float)y w:(float)w h:(float)h;

- (void)SKA_bg:(UIColor *)color;
- (void)SKA_circle;
- (void)SKA_ellipse;
- (void)SKA_layerRadius:(float)radius;
- (void)SKA_layerBorder:(UIColor *)border_color width:(float)border_width;
- (void)SKA_addSV:(UIView *)view, ...;
- (void)SKA_removeAllSubviews;
- (void)SKA_vshadow:(CGSize)size color:(UIColor *)shadow_color;

@end
