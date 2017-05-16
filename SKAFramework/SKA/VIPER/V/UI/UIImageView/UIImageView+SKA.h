//
//  UIImageView+SKA.h
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SKA)
+ (UIImage *)SKA_getWindowsScreenShot;
- (void)SKA_imgn:(NSString *)img;
- (void)SKA_imgn:(NSString *)img thumb:(NSString *)thumb;
@end
