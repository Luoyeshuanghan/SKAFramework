//
//  SKABaseTableView+Edit.h
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKABaseTableView.h"

@interface SKABaseTableView (Edit)
@property (nonatomic, assign) BOOL table_view_can_edit;
@property (nonatomic, strong) NSMutableArray<UITableViewRowAction *> * table_view_edit_array;
- (void)addTableViewRowAction:(NSString *)action_title action_name:(NSString *)action_name action_bg_color:(UIColor *)action_bg_color;
@end
