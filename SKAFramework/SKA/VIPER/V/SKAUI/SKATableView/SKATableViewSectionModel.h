//
//  SKATableViewSectionModel.h
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKATableViewModel.h"

@interface SKATableViewSectionModel : NSObject
@property (nonatomic, readonly, strong) NSString * section_name;
@property (nonatomic, assign) CGFloat section_height;
@property (nonatomic, strong) NSArray<SKATableViewModel *> * group_array;
@end
