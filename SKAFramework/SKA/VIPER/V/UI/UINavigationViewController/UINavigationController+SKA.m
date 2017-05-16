//
//  UINavigationController+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/5/16.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "UINavigationController+SKA.h"

@implementation UINavigationController (SKA)
- (void)SKA_alphaNavigationBar{
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"E"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage imageNamed:@"E"]];
}
- (void)SKA_setRootViewController:(NSString *)viewController{
    self.viewControllers = @[[NSClassFromString(viewController) new]];
}
- (void)SKA_navigationBarBg:(NSString *)img{
    [self.navigationBar setBackgroundImage:[[UIImage imageNamed:img] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage imageNamed:@"E"]];
}
@end

@implementation UIViewController (SKA)
#pragma mark - Left
- (void)SKA_leftButton:(NSString *)img action:(SEL)action{
    [self SKA_leftButton:img action:action img2:nil action2:nil img3:nil action3:nil];
}

- (void)SKA_leftButton:(NSString *)img action:(SEL)action img2:(NSString *)img2 action2:(SEL)action2{
    [self SKA_leftButton:img action:action img2:img2 action2:action2 img3:nil action3:nil];
}

- (void)SKA_leftButton:(NSString *)img action:(SEL)action img2:(NSString *)img2 action2:(SEL)action2 img3:(NSString *)img3 action3:(SEL)action3{
    UIView * ui_left_item = [UIView SKA_initAR:0 y:0 w:45 h:44];
    
    UIButton * left_item_button = [UIButton SKA_initAR:0 y:9 w:25 h:25];
    [left_item_button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [left_item_button SKA_bgImage:img];
    [ui_left_item addSubview:left_item_button];
    
    if (img2 != nil){
        UIButton * left_item_button2 = [UIButton SKA_initAR:35 y:9 w:25 h:25];
        [left_item_button2 addTarget:self action:action2 forControlEvents:UIControlEventTouchUpInside];
        [left_item_button2 SKA_bgImage:img2];
        [ui_left_item addSubview:left_item_button2];
        ui_left_item.SKA_w = SKAW(70);
    }
    
    if (img3 != nil){
        UIButton * left_item_button3 = [UIButton SKA_initAR:70 y:9 w:25 h:25];
        [left_item_button3 addTarget:self action:action3 forControlEvents:UIControlEventTouchUpInside];
        [left_item_button3 SKA_bgImage:img3];
        [ui_left_item addSubview:left_item_button3];
        ui_left_item.SKA_w = SKAW(105);
    }
    
    UIBarButtonItem * left_item = [[UIBarButtonItem alloc] initWithCustomView:ui_left_item];
    self.navigationItem.leftBarButtonItems = @[left_item];
}

#pragma mark - Right
- (void)SKA_rightButton:(NSString *)img action:(SEL)action{
    [self SKA_rightButton:img action:action img2:nil action2:nil img3:nil action3:nil];
}

- (void)SKA_rightButton:(NSString *)img action:(SEL)action img2:(NSString *)img2 action2:(SEL)action2{
    [self SKA_rightButton:img action:action img2:img2 action2:action2 img3:nil action3:nil];
}

- (void)SKA_rightButton:(NSString *)img action:(SEL)action img2:(NSString *)img2 action2:(SEL)action2 img3:(NSString *)img3 action3:(SEL)action3{
    UIView * ui_right_item = [UIView SKA_initAR:0 y:0 w:45 h:44];
    
    UIButton * right_item_button = [UIButton SKA_initAR:10 y:9 w:25 h:25];
    [right_item_button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [right_item_button SKA_bgImage:img];
    [ui_right_item addSubview:right_item_button];
    
    if (img2 != nil){
        UIButton * right_item_button2 = [UIButton SKA_initAR:45 y:9 w:25 h:25];
        [right_item_button2 addTarget:self action:action2 forControlEvents:UIControlEventTouchUpInside];
        [right_item_button2 SKA_bgImage:img2];
        [ui_right_item addSubview:right_item_button2];
        ui_right_item.SKA_w = SKAW(70);
    }
    
    if (img3 != nil){
        UIButton * right_item_button3 = [UIButton SKA_initAR:80 y:9 w:25 h:25];
        [right_item_button3 addTarget:self action:action3 forControlEvents:UIControlEventTouchUpInside];
        [right_item_button3 SKA_bgImage:img3];
        [ui_right_item addSubview:right_item_button3];
        ui_right_item.SKA_w = SKAW(105);
    }
    
    UIBarButtonItem * right_item = [[UIBarButtonItem alloc] initWithCustomView:ui_right_item];
    self.navigationItem.rightBarButtonItems = @[right_item];
}

- (void)SKA_configLeftBack{
    [self SKA_leftButton:@"General_back" action:@selector(SKA_back)];
}
@end
