//
//  SKATableView.h
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKABaseTableView.h"
#import "SKATableViewModel.h"
#import "SKATableViewCell.h"

@interface SKATableView : SKABaseTableView
@property (nonatomic, strong) NSMutableArray<SKATableViewModel *> * array;
- (void)initView:(id)delegate array:(NSMutableArray *)array;
- (void)SKA_reloadSingleData:(SKATableViewModel *)model;
@end
