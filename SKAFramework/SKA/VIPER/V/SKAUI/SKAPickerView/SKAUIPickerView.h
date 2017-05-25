//
//  SKAUIPickerView.h
//  MasonryTest
//
//  Created by YC on 16/12/14.
//  Copyright © 2016年 GRD. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SKAUIPICKERVIEW_PICKERVIEW_BG_COLOR [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0]
#define SKAUIPICKERVIEW_PICKERVIEW_FONT_SIZE 19.0
#define SKAUIPICKERVIEW_PICKERVIEW_TEXT_COLOR [UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:80.0/255.0 alpha:1.0]

#define SKAUIPICKERVIEW_TITLE_BG_COLOR [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0]
#define SKAUIPICKERVIEW_TITLE_FONT_SIZE 15.0
#define SKAUIPICKERVIEW_TITLE_TEXT_COLOR [UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:80.0/255.0 alpha:1.0]

#define SKAUIPICKERVIEW_LEFT_BUTTON_TEXT @"取消"
#define SKAUIPICKERVIEW_LEFT_BUTTON_BG_COLOR [UIColor colorWithRed:166.0/255.0 green:166.0/255.0 blue:166.0/255.0 alpha:1.0]
#define SKAUIPICKERVIEW_LEFT_BUTTON_FONT_SIZE 13.0
#define SKAUIPICKERVIEW_LEFT_BUTTON_TEXT_COLOR [UIColor whiteColor]

#define SKAUIPICKERVIEW_RIGHT_BUTTON_TEXT @"完成"
#define SKAUIPICKERVIEW_RIGHT_BUTTON_BG_COLOR [UIColor colorWithRed:166.0/255.0 green:166.0/255.0 blue:166.0/255.0 alpha:1.0]
#define SKAUIPICKERVIEW_RIGHT_BUTTON_FONT_SIZE 13.0
#define SKAUIPICKERVIEW_RIGHT_BUTTON_TEXT_COLOR [UIColor whiteColor]

@protocol SKAPickerViewDelegate;
@interface SKAUIPickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, strong) id pickerView_delegate;

@property (nonatomic, strong) NSString * name;/**< 名称 用于tag */
//UIPickerView Label字体字号
@property (nonatomic, assign) NSInteger picker_view_font_size;
//UIPickerView Label字体颜色
@property (nonatomic, strong) UIColor * picker_view_text_color;
//左侧按钮是否可用 默认为falsh
@property (nonatomic, assign) BOOL left_button_enable;
//右侧按钮是否可用 默认为true
@property (nonatomic, assign) BOOL right_button_enable;

//内容数组
@property (nonatomic, strong) NSMutableArray * data_source;
//当前选择位置数组
@property (nonatomic, strong) NSMutableArray<NSNumber *> * array_row;

//component长度 默认为0
@property (nonatomic, assign) NSInteger data_component;

//样式设置
- (void)setPickerView:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color;
- (void)setTitleView:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color;
- (void)setLeftButton:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color;
- (void)setRightButton:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color;
- (void)setTitleText:(NSString *)title_text;
- (void)setLeftButtonText:(NSString *)left_text;
- (void)setRightButtonText:(NSString *)right_text;
//设置左侧按钮点击事件 返回选中内容 默认为空 不传回component与row是因为 component是固定的 单列固定为0 多列也并没有意义 row为选中的列数，但我并不想将row公开给外部 所以此时只返回选中的对象就足够了
- (void)setLeftButtonAction:(void (^)(id result))left_button_action;
//设置右侧按钮点击事件 返回选中内容 默认为空 不传回component与row是因为 component是固定的 单列固定为0 多列也并没有意义 row为选中的列数，但我并不想将row公开给外部 所以此时只返回选中的对象就足够了
- (void)setRightButtonAction:(void (^)(id result))left_button_action;
//设置数组内容
- (void)setData:(NSMutableArray<NSString *> *)data;
/**
 传入复杂数据
 
 @param obj_data       复杂数据对象 如Object:NSString * id, NSString * name;
 @param obj_set_string 对象显示字段 如name
 */
- (void)setDataWithObject:(NSMutableArray<id> *)obj_data objSetString:(NSString *)obj_set_string;
//设置默认选项 即打开时UIPickerView默认滚动到指定行
- (void)setDefaultData:(NSString *)default_data;
//设置默认选项 并可以根据key设置
- (void)setDefaultData:(id)default_data key:(NSString *)key;
//获取data所在数组行
- (NSInteger)getIndexWithData:(NSArray *)array key:(NSString *)key data:(id)data;
//当数据变更时刷新UIPickerView
- (void)reload_data;
//当数据变更时完全刷新UIPickerView 包括重置选中行
- (void)reload_all_data;
//取消选择
- (void)cancel;
//完成选择 执行delegate->didSelectPickerView
- (void)finish;
//设置UIPickerView当前选中行
- (void)selectComponent:(NSInteger)component row:(NSInteger)row;
@end
@protocol SKAPickerViewDelegate <NSObject>
@optional
//在滚动选择时调用 不传回component与row是因为 component是固定的 单列固定为0 多列也并没有意义 row为选中的列数，但我并不想将row公开给外部 所以此时只返回选中的对象就足够了
- (void)willSelectPickerView:(SKAUIPickerView *)picker_view result:(id)result;
@required
//在点击完成时调用 不传回component与row是因为 component是固定的 单列固定为0 多列也并没有意义 row为选中的列数，但我并不想将row公开给外部 所以此时只返回选中的对象就足够了
- (void)didSelectPickerView:(SKAUIPickerView *)picker_view result:(id)result;
@end
