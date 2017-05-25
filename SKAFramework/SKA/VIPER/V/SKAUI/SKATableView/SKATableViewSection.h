//
//  SKATableViewSection.h
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKABaseTableView.h"
#import "SKATableViewSectionModel.h"
#import "SKATableViewSectionView.h"

@interface SKATableViewSection : SKABaseTableView
@property (nonatomic, strong) NSMutableArray<SKATableViewSectionModel *> * section_model_array;
- (void)initView:(id)delegate array:(NSMutableArray<SKATableViewSectionModel *> *)section_model_array;
- (void)initView:(id)delegate array:(NSMutableArray<SKATableViewSectionModel *> *)section_model_array style:(UITableViewStyle)style;
@end
