//
//  SKAMorePickerView.h
//  辽宁飞豹
//
//  Created by JZZ on 2016/12/16.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKAUIPickerView.h"
//多列UIPickerView
@interface SKAMorePickerView : SKAUIPickerView
- (void)setDataWithMoreArray:(NSMutableArray *)array_data cascade_array:(NSArray<NSString *> *)cascade_array show_key_array:(NSArray<NSString *> *)show_key_array;
- (void)setDefaultMoreData:(NSArray *)default_data_dictionary;
- (void)setDefaultMoreData:(NSArray *)default_data_dictionary key:(NSArray *)key;
@end
