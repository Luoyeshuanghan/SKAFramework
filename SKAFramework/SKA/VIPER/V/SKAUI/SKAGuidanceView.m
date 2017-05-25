//
//  SKAGuidanceView.m
//  SKAFramework
//
//  Created by JZZ on 2017/2/6.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKAGuidanceView.h"

@interface SKAGuidanceView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView * scroll_view;

@property (nonatomic, assign) float float_circle_width;
@property (nonatomic, strong) UIView * float_cirlce;

@property (nonatomic, assign) float touch_start_point;
@property (nonatomic, assign) float touch_start_x;
@end
@implementation SKAGuidanceView
/**
 初始化引导页
 半径 间距 颜色等一系列参数并未设置成常量，为了以后还能顺带着实现轮播图做准备
 
 @param circle_diameter 圆点半径
 @param circle_color 圆点颜色
 @param circle_margin 圆点间距
 @param arr_image 图片数组
 @param circle_view_margin_bottom 圆点View下边距
 */
- (void)initGuidanceView:(float)circle_diameter circle_color:(UIColor *)circle_color circle_margin:(float)circle_margin arr_image:(NSArray<NSString *> *)arr_image circle_view_margin_bottom:(float)circle_view_margin_bottom{
    [self SKA_bg:[UIColor whiteColor]];
    
    //初始化各参数
    self.circle_diameter = circle_diameter;
    self.circle_color = circle_color;
    self.circle_margin = circle_margin;
    self.arr_image = arr_image;
    self.circle_view_margin_bottom = circle_view_margin_bottom;
    self.float_circle_width = self.circle_diameter * 2 + self.circle_margin;
    
    [self buildScrollViewWithImageArr:arr_image];
}

/**
 通过数组设置View

 @param arr_image 图片数组
 */
- (void)buildScrollViewWithImageArr:(NSArray<NSString *> *)arr_image{
    self.scroll_view = ({
        UIScrollView * sv = [[UIScrollView alloc] initWithFrame:self.frame];
        sv.pagingEnabled = YES;
        sv.bounces = NO;
        sv.delegate = self;
        sv.contentSize = CGSizeMake(self.frame.size.width * arr_image.count, self.frame.size.height);
        sv.showsHorizontalScrollIndicator = NO;
        sv;
    });
    [self addSubview:self.scroll_view];
    for (int i = 0 ; i < arr_image.count ; ++ i){
        UIImageView * iv = [[UIImageView alloc] initWithFrame:CGRectMake(self.scroll_view.frame.size.width * i, 0, self.scroll_view.frame.size.width, self.scroll_view.frame.size.height)];
        [iv SKA_imgn:arr_image[i]];
        [self.scroll_view addSubview:iv];
    }
    
    UIView * circle_view = ({
        UIView * ui = [UIView new];
        [ui SKA_bg:SKA_CLS];
        ui;
    });
    [self addSubview:circle_view];
    [circle_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.circle_view_margin_bottom * -1);
        make.height.mas_equalTo(self.circle_diameter);
        make.width.mas_equalTo(self.circle_diameter + (self.circle_diameter + self.circle_margin) * arr_image.count);
        make.centerX.equalTo(self.scroll_view.mas_centerX);
    }];
    
    //此处遍历数组长度+1 因圆点数量比数组多一个
    for (int i = 0 ; i <= arr_image.count ; ++ i){
        UIView * ui = [[UIView alloc] initWithFrame:CGRectMake(i * (self.circle_diameter + self.circle_margin), 0, self.circle_diameter, self.circle_diameter)];
        [ui SKA_layerRadius:self.circle_diameter / 2];
        [ui SKA_bg:self.circle_color];
        [circle_view addSubview:ui];
    }
    
    self.float_cirlce = ({
        UIView * ui = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.float_circle_width, self.circle_diameter)];
        [ui SKA_layerRadius:self.circle_diameter / 2];
        [ui SKA_bg:self.circle_color];
        ui;
    });
    [circle_view addSubview:self.float_cirlce];
}

#pragma mark - UIScrollViewDelegate
//按下时触发 记录当前点击位置与浮动圆点x轴位置
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.touch_start_point = scrollView.contentOffset.x;
    self.touch_start_x = self.float_cirlce.SKA_x;
}
//滚动时触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //记录比例 如: 若当前ScrollView的宽为375 一个圆点加边距=37.5 则ScrollView每移动1px 圆点的x轴或宽就会增加0.1px 此时的percent即为1:0.1 = 10 : 1 = 10
    CGFloat percent = scrollView.SKA_w/(self.circle_diameter + self.circle_margin);
    //获取移动位置 当前位置减去按下时的位置得到移动的距离
    float mod = scrollView.contentOffset.x - self.touch_start_point;
    //上一行的mod为ScrollView移动距离 此处换算成圆点移动距离
    mod = mod / percent;
    //判断是翻到下一页还是上一页
    BOOL is_next = scrollView.contentOffset.x >= self.touch_start_point;
    if (is_next){
        //如果是下一页 则只改变控件的宽度
        self.float_cirlce.SKA_w = self.float_circle_width + mod;
    } else {
        //如果是上一页 则需要同时改变控件的x轴 此处因为是向左滑动，故mod此时为负数，所以控件的宽要减去mod来修正宽度
        self.float_cirlce.SKA_x = self.touch_start_x + mod;
        self.float_cirlce.SKA_w = self.float_circle_width - mod;
    }
}
//抬起时禁止移动并立即触发scrollViewDidEndDecelerating 此处是为了防止用户在连续翻页时不会触发scrollViewDidEndDecelerating，所以就决定禁止用户的连续翻页操作
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    scrollView.scrollEnabled = NO;
}
//当滚动停止时根据滚动位置执行动画
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取当前所在页数
    NSInteger index = scrollView.contentOffset.x / scrollView.SKA_w;
    //执行动画
    [UIView animateWithDuration:0.1 animations:^{
        //初始化控件宽度
        self.float_cirlce.SKA_w = self.float_circle_width;
        //更新控件x轴
        self.float_cirlce.SKA_x = (self.circle_diameter + self.circle_margin) * index;
        //在动画结束前禁止用户再次触发滚动事件
        scrollView.scrollEnabled = NO;
    }completion:^(BOOL finished){
        //动画结束后解除禁止滚动事件
        scrollView.scrollEnabled = YES;
    }];
    [self.guidancev_delegate guidanceView:index isLast:index == self.arr_image.count - 1];
}

@end
