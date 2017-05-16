//
//  NSString+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "NSString+SKA.h"

@implementation NSString (SKA)
//去掉所有空格
- (NSString *)SKATrim{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}
//切割字符串成数组
- (NSArray *)SKASplit:(NSString *)string{
    NSArray * array = [self componentsSeparatedByString:string];
    return array;
}
//转义HTML
- (NSString *)SKAToHTML{
    NSString * return_html;
    NSScanner * scanner = [NSScanner scannerWithString:self];
    NSString * text = nil;
    while([scanner isAtEnd]==NO){
        //找到标签的起始位置
        [scanner scanUpToString:@"<"intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">"intoString:&text];
        //替换字符
        return_html = [self stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text]withString:@""];
    }
    return return_html;
}
//字符串追加
- (NSString *)SKAAppend:(NSString *)str{
    if (str == nil || [str isEqualToString:@""]){
        return self;
    } else {
        return [self stringByAppendingString:str];
    }
}
//字符串替换
- (NSString *)SKAReplace:(NSString *)str with_str:(NSString *)with_str{
    return [self stringByReplacingOccurrencesOfString:str withString:with_str];
}
//转换成URL
- (NSURL *)SKAToURL{
    return [NSURL URLWithString:self];
}
//转换成UTF8
- (NSString *)SKAToUTF8{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}
//转换成encode
- (NSString *)SKAEncode{
    [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return [self stringByRemovingPercentEncoding];
}
//转换成decode
- (NSString *)SKADecode{
    return [self stringByRemovingPercentEncoding];
}
//是否包含字符串
- (BOOL)SKAHasStringWithKey:(NSString *)key{
    return [self rangeOfString:key].location != NSNotFound;
}

- (CGFloat)SKAGetHeight:(CGFloat)width font:(UIFont *)font{
    CGSize size = CGSizeMake(SKAW(width), 3000);
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.height;
}

- (CGFloat)SKAGetWidth:(CGFloat)height font:(UIFont *)font{
    CGSize size = CGSizeMake(3000, SKAH(height));
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.width;
}
@end
