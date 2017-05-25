//
//  SKATableViewSectionModel.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKATableViewSectionModel.h"

@implementation SKATableViewSectionModel
- (NSString *)section_name{
    return [NSStringFromClass([self class]) stringByReplacingOccurrencesOfString:@"Model" withString:@"View"];
}
- (void)setGroup_array:(NSArray<SKATableViewModel *> *)group_array{
    _group_array = group_array;
    for (SKATableViewModel * table_view_model in group_array){
        table_view_model.section_model = self;
    }
}
@end
