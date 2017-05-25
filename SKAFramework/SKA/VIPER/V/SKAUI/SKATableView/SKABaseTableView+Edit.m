//
//  SKABaseTableView+Edit.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKABaseTableView+Edit.h"
#import <objc/runtime.h>

static void * SKATableViewCanEditKey = (void *)@"SKATableViewCanEditKey";
static void * SKATableViewEditArrayKey = (void *)@"SKATableViewEditArrayKey";

@implementation SKABaseTableView (Edit)
@dynamic table_view_can_edit, table_view_edit_array;
- (void)setTable_view_can_edit:(BOOL)table_view_can_edit{
    objc_setAssociatedObject(self, SKATableViewCanEditKey, [NSNumber numberWithBool:table_view_can_edit], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)table_view_can_edit{
    int can_edit = [objc_getAssociatedObject(self, SKATableViewCanEditKey) intValue];
    return can_edit;
}

- (void)setTable_view_edit_array:(NSMutableArray *)table_view_edit_array{
    objc_setAssociatedObject(self, SKATableViewEditArrayKey, table_view_edit_array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSMutableArray *)table_view_edit_array{
    return objc_getAssociatedObject(self, SKATableViewEditArrayKey);
}

#pragma mark 在滑动手势删除某一行的时候，显示出更多的按钮
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.table_view_edit_array;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.table_view_can_edit && ![self getObjectFromArrayWithIndexPath:indexPath].cant_edit;
}

- (void)addTableViewRowAction:(NSString *)action_title action_name:(NSString *)action_name action_bg_color:(UIColor *)action_bg_color{
    if (self.table_view_edit_array == nil){
        self.table_view_edit_array = [NSMutableArray new];
    }
    //UITableViewRowActionStyleDefault 默认为红色 UITableViewRowActionStyleNormal 为灰色
    UITableViewRowAction * table_view_row_action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:action_title handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        if([self.cell_delegate respondsToSelector:NSSelectorFromString([action_name stringByAppendingString:@":"])]){
            [self.cell_delegate performSelector:NSSelectorFromString([action_name stringByAppendingString:@":"]) withObject:[self getObjectFromArrayWithIndexPath:indexPath]];
        } else {
            NSLog(@"ERROR:请在%@类中实现<-(void)%@:(%@ *)model>方法", [self.cell_delegate class], action_name, NSStringFromClass([[self getObjectFromArrayWithIndexPath:indexPath] class]));
        }
    }];
    table_view_row_action.backgroundColor = action_bg_color;
    [self.table_view_edit_array addObject:table_view_row_action];
}

@end
