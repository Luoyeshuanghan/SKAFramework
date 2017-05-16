//
//  UINavigationController+SKA.h
//  SKAFramework
//
//  Created by JYC on 2017/5/16.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (SKA)
- (void)SKA_alphaNavigationBar;
- (void)SKA_setRootViewController:(NSString *)viewController;
- (void)SKA_navigationBarBg:(NSString *)img;
@end

@interface UIViewController (SKA)
- (void)SKA_leftButton:(NSString *)img action:(SEL)action;
- (void)SKA_leftButton:(NSString *)img action:(SEL)action img2:(NSString *)img2 action2:(SEL)action2;
- (void)SKA_leftButton:(NSString *)img action:(SEL)action img2:(NSString *)img2 action2:(SEL)action2 img3:(NSString *)img3 action3:(SEL)action3;
- (void)SKA_configLeftBack;
- (void)SKA_rightButton:(NSString *)img action:(SEL)action;
- (void)SKA_rightButton:(NSString *)img action:(SEL)action img2:(NSString *)img2 action2:(SEL)action2;
- (void)SKA_rightButton:(NSString *)img action:(SEL)action img2:(NSString *)img2 action2:(SEL)action2 img3:(NSString *)img3 action3:(SEL)action3;
@end
