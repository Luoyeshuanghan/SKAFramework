//
//  SKABaseTableView.h
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKATableViewModel.h"
#import "SKATableViewCell.h"

@protocol SKATableViewDelegate;
@interface SKABaseTableView : UIView<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) id cell_delegate;//引用该SKATableView的类传递
@property (nonatomic, strong) UITableView * table_view;
- (void)initBaseTableView:(id)delegate;
- (void)initBaseTableView:(id)delegate style:(UITableViewStyle)style;
- (void)reloadData;
- (SKATableViewModel *)getObjectFromArrayWithIndexPath:(NSIndexPath *)indexPath;
@end
@protocol SKATableViewDelegate <NSObject>
- (void)select_delegate:(UITableView *)table_view index_path:(NSIndexPath *)index_path cell_model:(SKATableViewModel *)cell_model;
@end
