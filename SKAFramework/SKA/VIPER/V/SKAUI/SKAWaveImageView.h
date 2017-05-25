//
//  SKAWaveImageView.h
//  ios 动画
//
//  Created by JZZ on 2017/3/2.
//  Copyright © 2017年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKAWaveImageView : UIImageView
/**
 初始化
 */
- (void)initProgress;
/**
 结束初始化
 */
- (void)endProgress;
- (void)setProgress:(int)progress;
@end
