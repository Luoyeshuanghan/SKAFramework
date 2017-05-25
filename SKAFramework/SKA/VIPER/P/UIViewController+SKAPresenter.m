//
//  UIViewController+SKAPresenter.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/12/8.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "UIViewController+SKAPresenter.h"

@implementation UIViewController (SKAPresenter)
- (id)presenterInsetView{
    NSString * temp_name = NSStringFromClass([self class]);
//    temp_name = [temp_name substringFromIndex:temp_name.length - 1];
    temp_name = [temp_name substringWithRange:NSMakeRange(0, temp_name.length - 1)];
//    NSString * view_name = [NSStringFromClass([self class]) stringByReplacingOccurrencesOfString:temp_name withString:@"V"];;
    NSString * view_name = [temp_name SKAAppend:@"V"];
    UIView * view = [NSClassFromString(view_name) new];
    [view SKA_bg:[UIColor whiteColor]];
    self.view = view;
    [view initView];
    return view;
}
- (void)SKA_statusBarsColor:(NSString *)color{
    if ([color isEqualToString:@"light"]){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
}
@end
