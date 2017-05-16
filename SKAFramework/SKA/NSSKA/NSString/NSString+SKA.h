//
//  NSString+SKA.h
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SKA)
//去掉所有空格
- (NSString * )SKATrim;
//切割字符串成数组
- (NSArray * )SKASplit:(NSString * )string;
//字符串追加
- (NSString * )SKAAppend:(NSString * )str;
//字符串替换
- (NSString * )SKAReplace:(NSString * )str with_str:(NSString * )with_str;
//转换成URL
- (NSURL * )SKAToURL;
//转换成UTF8
- (NSString * )SKAToUTF8;
//是否包含字符串
- (BOOL)SKAHasStringWithKey:(NSString * )key;
//转换成encode
- (NSString * )SKAEncode;
//转换成decode
- (NSString * )SKADecode;
//获取高度
- (CGFloat)SKAGetHeight:(CGFloat)width font:(UIFont * )font;
//获取宽度
- (CGFloat)SKAGetWidth:(CGFloat)height font:(UIFont * )font;
//转义HTML
- (NSString * )SKAToHTML;
@end
