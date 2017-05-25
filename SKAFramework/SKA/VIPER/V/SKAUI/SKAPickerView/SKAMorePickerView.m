//
//  SKAMorePickerView.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/12/16.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKAMorePickerView.h"
@interface SKAMorePickerView ()
@property (nonatomic, strong) UIPickerView * picker_view;
//级联数组 使SKAUIPickerView根据级联数组显示不同列中内容 如国家列表中包含provice_list(省/州)数组 省/州列表中包含city_list(市)数组 城市列表中包含area_list(区)数组 则传入@[@"province_list", @"city_list", @"area_list", @""] 又因为区数组中不再包含子级 则最后一个参数可省略成@[@"province_list", @"city_list", @"area_list"]
@property (nonatomic, strong) NSArray<NSString *> * cascade_array;
//显示key数组 在SKAUIPickerView的label中显示key字段的内容 如国家列表country_name 省列表province_name 市列表city_name 区列表area_name 则传入@[@"country_name", @"province_name", @"city_name", @"area_name"]
@property (nonatomic, strong) NSArray<NSString *> * show_key_array;
@end

@implementation SKAMorePickerView

/**
 设置多行数组

 @param array_data     多行数组
 @param cascade_array  级联数组
 @param show_key_array key数组
 */
- (void)setDataWithMoreArray:(NSMutableArray *)array_data cascade_array:(NSArray<NSString *> *)cascade_array show_key_array:(NSArray<NSString *> *)show_key_array{
    self.data_source = array_data;
    self.cascade_array = cascade_array;
    self.show_key_array = show_key_array;
    self.data_component = show_key_array.count;
    [self reload_data];
}
- (NSMutableArray *)getArrayWithComponent:(NSInteger)component{
    if (component == 0){
        return self.data_source;
    } else {
        return [self getLastArray:self.data_source start_com:0 com:component];
    }
}
- (NSMutableArray *)getLastArray:(NSMutableArray *)array start_com:(NSInteger)start_com com:(NSInteger)component{
    if (start_com == component){
        return array;
    } else {
        NSInteger now_row = [self.array_row[start_com] intValue];
        NSMutableArray * arr = [array[now_row] valueForKey:self.cascade_array[start_com]];
        NSMutableArray * str = [self getLastArray:arr start_com:start_com + 1 com:component];
        return str;
    }
}

- (void)setDefaultMoreData:(NSArray *)default_data_dictionary{
    [self setDefaultMoreData:default_data_dictionary key:nil];
}

- (void)setDefaultMoreData:(NSArray *)default_data_dictionary key:(NSArray *)key{
    if (key == nil){
        key = self.show_key_array;
    }
    
    if (default_data_dictionary.count != self.data_component){
        NSLog(@"ERROR:传入的数组长度与原有Component不符");
        return;
    }
    
    for (int i = 0 ; i < self.data_component ; ++ i){
        NSMutableArray * temp_array = [self getLastArray:self.data_source start_com:0 com:i];
        NSInteger row = [self getIndexWithData:temp_array key:key[i] data:default_data_dictionary[i]];
        self.array_row[i] = [NSNumber numberWithInteger:row];
        [self.picker_view selectRow:row inComponent:i animated:NO];
    }
    
    [self reload_data];
}

#pragma mark - UIPickerViewResource
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self getArrayWithComponent:component].count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (self.array_row[component] == [NSNumber numberWithInteger:row]){
        return;
    }
    
    for (NSInteger i = component + 1 ; i < self.data_component ; ++ i){
        [self.picker_view selectRow:0 inComponent:i animated:NO];
        self.array_row[i] = @0;
    }
    
    self.array_row[component] = [NSNumber numberWithInteger:row];
    
    [self.pickerView_delegate willSelectPickerView:self result:[self getObject]];
    [self reload_data];
}

- (NSString *)setText:(NSInteger)component row:(NSInteger)row{
    return [[self getArrayWithComponent:component][row] valueForKey:self.show_key_array[component]];
}

- (id)getObject{
    NSMutableArray * result_array = [NSMutableArray new];
    for (int i = 0 ; i < self.data_component ; ++ i){
        NSMutableArray * temp_array = [self getLastArray:self.data_source start_com:0 com:i];
        [result_array addObject:temp_array[[self.array_row[i] integerValue]]];
    }
    return result_array;
}

@end
