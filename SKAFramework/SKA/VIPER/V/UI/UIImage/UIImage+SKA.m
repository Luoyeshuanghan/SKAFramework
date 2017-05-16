//
//  UIImage+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/5/16.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "UIImage+SKA.h"

@implementation UIImage (SKA)
+ (UIImage *)SKA_scale:(UIImage *)img scale:(double)scale{
    //创建一个等比的CGSize
    CGSize size = CGSizeMake(img.size.width*scale, img.size.height*scale);
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}
@end
