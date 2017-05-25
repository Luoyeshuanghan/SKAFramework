//
//  SKATableViewModel.h
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SKATableViewSectionModel;

@interface SKATableViewModel : NSObject
@property (nonatomic, readonly, strong) NSString * cell_name;
@property (nonatomic, assign) CGFloat cell_height;
@property (nonatomic, strong) SKATableViewSectionModel * section_model;//当需要SectionModel时使用
@property (nonatomic, assign) BOOL cant_edit;//YES 不可编辑 NO 可编辑 默认为NO
@end
