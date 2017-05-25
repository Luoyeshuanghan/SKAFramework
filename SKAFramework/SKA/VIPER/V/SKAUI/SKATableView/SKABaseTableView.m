//
//  SKABaseTableView.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKABaseTableView.h"

@implementation SKABaseTableView

- (void)initBaseTableView:(id)delegate{
    [self initBaseTableView:delegate style:UITableViewStylePlain];
}

- (void)initBaseTableView:(id)delegate style:(UITableViewStyle)style{
    self.cell_delegate = delegate;
    
    if (self.table_view != nil){
        [self.table_view removeFromSuperview];
        self.table_view = nil;
    }
    
    if (!self.table_view){
        self.table_view = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:style];
        self.table_view.separatorStyle = NO;
        [self.table_view SKA_bg:SKA_CLS];
        
        [self addSubview:self.table_view];
    }
    
    self.table_view.delegate = self;
    self.table_view.dataSource = self;
}

- (void)reloadData{
    [self.table_view reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [SKATableViewCell new];
}
- (SKATableViewModel *)getObjectFromArrayWithIndexPath:(NSIndexPath *)indexPath{return nil;}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

@end
