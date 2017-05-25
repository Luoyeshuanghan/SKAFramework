//
//  SKATableViewSectionView.h
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKATableViewSectionModel.h"

@interface SKATableViewSectionView : UIView
@property (nonatomic, assign) id delegate;
- (void)initView:(id)delegate model:(SKATableViewSectionModel *)model;
- (void)addSectionAction:(UIButton *)btn action_name:(NSString *)action_name;
@end
