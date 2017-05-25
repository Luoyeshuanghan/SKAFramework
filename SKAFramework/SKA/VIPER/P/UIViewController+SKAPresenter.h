//
//  UIViewController+SKAPresenter.h
//  辽宁飞豹
//
//  Created by JZZ on 2016/12/8.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SKAPresenter)
//将View铺设到Presenter上
- (id)presenterInsetView;
- (void)SKA_statusBarsColor:(NSString *)color;
@end
