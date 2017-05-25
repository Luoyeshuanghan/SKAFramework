//
//  SKATableView.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKATableView.h"

@implementation SKATableView

- (void)initView:(id)delegate array:(NSMutableArray *)array{
    [self initBaseTableView:delegate];
    self.array = array;
    for (SKATableViewModel * table_model in array){
        if (table_model == nil || [table_model isEqual:[NSNull null]]){
            continue;
        }
        NSString * register_cell_name = [NSStringFromClass([table_model class]) stringByReplacingOccurrencesOfString:@"Model" withString:@"Cell"];
        [self.table_view registerClass:[NSClassFromString(register_cell_name) class] forCellReuseIdentifier:register_cell_name];
    }
}

- (id)getObjectFromArrayWithIndexPath:(NSIndexPath *)indexPath{
    return self.array[indexPath.row];
}

#pragma mark - UITableView_Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cell_name = self.array[indexPath.row].cell_name;
    SKATableViewModel * cell_object = self.array[indexPath.row];
    SKATableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cell_name forIndexPath:indexPath];
    [cell initView:self.cell_delegate model:cell_object];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.cell_delegate respondsToSelector:NSSelectorFromString(@"select_delegate:index_path:cell_model:")]){
        [self.cell_delegate select_delegate:tableView index_path:indexPath cell_model:self.array[indexPath.row]];
    } else {
        NSLog(@"请在%@类中实现协议<- (void)select_delegate:(UITableView *)table_view index_path:(NSIndexPath *)index_path cell_model:(%@ *)cell_model>", [self.cell_delegate class], NSStringFromClass([self.array[indexPath.row] class]));
    }
}

- (void)SKA_reloadSingleData:(SKATableViewModel *)model{
    [self.table_view reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[self SKA_getIndexFromModel:model] inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}
//获取model所在下标
- (int)SKA_getIndexFromModel:(SKATableViewModel *)model{
    for (int i = 0 ; i < self.array.count ; ++ i){
        if (model == self.array[i]){
            return i;
        }
    }
    return 0;
}

@end
