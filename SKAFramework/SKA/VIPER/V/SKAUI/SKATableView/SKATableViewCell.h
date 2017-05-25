//
//  SKATableViewCell.h
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKATableViewModel.h"

@interface SKATableViewCell : UITableViewCell
@property (nonatomic, assign) id delegate;
@property (nonatomic, strong) SKATableViewModel * cell_model;

- (void)initCell;
- (void)initView:(id)delegate model:(SKATableViewModel *)model;
- (void)initView:(SKATableViewModel *)model;
- (void)addCellAction:(NSString *)action_name;
- (void)addCellAction:(NSString *)action_name model:(id)model;
- (void)addCellAction:(UIButton *)btn action_name:(NSString *)action_name;
@end
