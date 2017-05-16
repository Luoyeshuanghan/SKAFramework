//
//  UIViewController+SKANetInterfactor.h
//  辽宁飞豹
//
//  Created by JZZ on 2016/12/7.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewController (SKANetInterfactor)
- (void)netWork_s200:(NSString *)info;//info不为空时弹出提示
- (void)netWork_s201:(NSString *)info;//未登录
- (void)netWork_s202:(NSString *)info;//未填写资料
- (void)netWork_s500:(NSString *)info;//错误时弹出info提示
@end
