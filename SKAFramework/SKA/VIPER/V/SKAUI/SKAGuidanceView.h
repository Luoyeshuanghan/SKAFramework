//
//  SKAGuidanceView.h
//  SKAFramework
//
//  Created by JZZ on 2017/2/6.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SKAGuidanceViewDelegate <NSObject>
- (void)guidanceView:(NSInteger)index isLast:(BOOL)is_last;
@end
@interface SKAGuidanceView : UIView
@property (nonatomic, assign) float circle_diameter;/**< 圆点直径 */
@property (nonatomic, strong) UIColor * circle_color;/**< 圆点背景颜色 */
@property (nonatomic, assign) float circle_margin;/**< 圆点间距 */
@property (nonatomic, strong) NSArray<NSString *> * arr_image;/**< 图片数组 */
@property (nonatomic, assign) float circle_view_margin_bottom;/**< 底部边距 */
@property (nonatomic, assign) id guidancev_delegate;/**< 代理 */
/**
 初始化引导页
 半径 间距 颜色等一系列参数并未设置成常量，为了以后还能顺带着实现轮播图做准备

 @param circle_diameter 圆点半径
 @param circle_color 圆点颜色
 @param circle_margin 圆点间距
 @param arr_image 图片数组
 @param circle_view_margin_bottom 圆点View下边距
 */
- (void)initGuidanceView:(float)circle_diameter circle_color:(UIColor *)circle_color circle_margin:(float)circle_margin arr_image:(NSArray<NSString *> *)arr_image circle_view_margin_bottom:(float)circle_view_margin_bottom;
@end
