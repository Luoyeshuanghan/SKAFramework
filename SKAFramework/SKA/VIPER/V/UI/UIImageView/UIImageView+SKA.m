//
//  UIImageView+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "UIImageView+SKA.h"

@implementation UIImageView (SKA)
+ (UIImage *)SKA_getWindowsScreenShot{
    UIView * view = ((AppDelegate *)[UIApplication sharedApplication].delegate).window;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(view.frame.size.width, view.frame.size.height), NO, 1.0);  //NO，YES 控制是否透明
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (void)SKA_imgn:(NSString *)img{
    [self SKA_imgn:img thumb:@"E"];
}
- (void)SKA_imgn:(NSString *)img thumb:(NSString *)thumb{
    if ([img isEqual:[NSNull null]] || img == nil || [[img SKATrim] isEqualToString:@""]){
        self.image = [UIImage imageNamed:thumb];
        return;
    }
    if ([img hasPrefix:@"http://"] || [img hasPrefix:@"https://"]){
//        [self sd_setImageWithURL:[img SKAToURL] placeholderImage:[UIImage imageNamed:thumb]];
    } else if ([img hasPrefix:@"images/Images"]){
        img = [@"http://oss.jiujiu.gerui.org/" SKAAppend:img];
//        [self sd_setImageWithURL:[img SKAToURL] placeholderImage:[UIImage imageNamed:thumb]];
    } else {
        self.image = [UIImage imageNamed:img];
    }
}
@end
