//
//  SKATableViewSection.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKATableViewSection.h"

@implementation SKATableViewSection
- (void)initView:(id)delegate array:(NSMutableArray<SKATableViewSectionModel *> *)section_model_array{
    [self initView:delegate array:section_model_array style:UITableViewStylePlain];
}
- (void)initView:(id)delegate array:(NSMutableArray<SKATableViewSectionModel *> *)section_model_array style:(UITableViewStyle)style{
    [self initBaseTableView:delegate style:style];
    self.section_model_array = section_model_array;
    for (SKATableViewSectionModel * section_model in section_model_array){
        for (SKATableViewModel * table_model in section_model.group_array){
            NSString * register_cell_name = [NSStringFromClass([table_model class]) stringByReplacingOccurrencesOfString:@"Model" withString:@"Cell"];
            [self.table_view registerClass:[NSClassFromString(register_cell_name) class] forCellReuseIdentifier:register_cell_name];
        }
    }
    self.table_view.estimatedSectionHeaderHeight = 64;
}
- (id)getObjectFromArrayWithIndexPath:(NSIndexPath *)indexPath{
    if (self.section_model_array.count > 0){
        return self.section_model_array[indexPath.section].group_array[indexPath.row];
    } else {
        return nil;
    }
}
#pragma mark - UITableView_Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.section_model_array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00000001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SKATableViewSectionView * section_view = [NSClassFromString(self.section_model_array[section].section_name) new];
    [section_view initView:self.cell_delegate model:self.section_model_array[section]];
    return section_view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.section_model_array.count > 0){
        return self.section_model_array[section].group_array.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cell_name = self.section_model_array[indexPath.section].group_array[indexPath.row].cell_name;
    SKATableViewModel * cell_object = self.section_model_array[indexPath.section].group_array[indexPath.row];
    SKATableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cell_name forIndexPath:indexPath];
    [cell initView:self.cell_delegate model:cell_object];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.cell_delegate respondsToSelector:NSSelectorFromString(@"select_delegate:index_path:cell_model:")]){
        [self.cell_delegate select_delegate:tableView index_path:indexPath cell_model:self.section_model_array[indexPath.section].group_array[indexPath.row]];
    } else {
        NSLog(@"请在%@类中实现协议<- (void)select_delegate:(UITableView *)table_view index_path:(NSIndexPath *)index_path cell_model:(%@ *)cell_model>", [self.cell_delegate class], NSStringFromClass([self.section_model_array[indexPath.section].group_array[indexPath.row] class]));
    }
}

@end
