//
//  SKAUIDatePicker.h
//  啾啾健康版
//
//  Created by JZZ on 2017/3/9.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKABaseView.h"

#define SKAUIDATEPICKER_DATEPICKER_BG_COLOR [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0]
#define SKAUIDATEPICKER_DATEPICKER_FONT_SIZE 19.0
#define SKAUIDATEPICKER_DATEPICKER_TEXT_COLOR [UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:80.0/255.0 alpha:1.0]

#define SKAUIDATEPICKER_TITLE_BG_COLOR [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0]
#define SKAUIDATEPICKER_TITLE_FONT_SIZE 15.0
#define SKAUIDATEPICKER_TITLE_TEXT_COLOR [UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:80.0/255.0 alpha:1.0]

#define SKAUIDATEPICKER_LEFT_BUTTON_TEXT @"取消"
#define SKAUIDATEPICKER_LEFT_BUTTON_BG_COLOR [UIColor colorWithRed:166.0/255.0 green:166.0/255.0 blue:166.0/255.0 alpha:1.0]
#define SKAUIDATEPICKER_LEFT_BUTTON_FONT_SIZE 13.0
#define SKAUIDATEPICKER_LEFT_BUTTON_TEXT_COLOR [UIColor whiteColor]

#define SKAUIDATEPICKER_RIGHT_BUTTON_TEXT @"完成"
#define SKAUIDATEPICKER_RIGHT_BUTTON_BG_COLOR [UIColor colorWithRed:166.0/255.0 green:166.0/255.0 blue:166.0/255.0 alpha:1.0]
#define SKAUIDATEPICKER_RIGHT_BUTTON_FONT_SIZE 13.0
#define SKAUIDATEPICKER_RIGHT_BUTTON_TEXT_COLOR [UIColor whiteColor]

@protocol SKAUIDatePickerDelegate;
@interface SKAUIDatePicker : SKABaseView
@property (nonatomic, strong) id datePicker_delegate;
@property (nonatomic, strong) NSString * name;/**< 名称 用于tag */
//UIPickerView Label字体字号
@property (nonatomic, assign) NSInteger picker_view_font_size;
//UIPickerView Label字体颜色
@property (nonatomic, strong) UIColor * picker_view_text_color;
//左侧按钮是否可用 默认为falsh
@property (nonatomic, assign) BOOL left_button_enable;
//右侧按钮是否可用 默认为true
@property (nonatomic, assign) BOOL right_button_enable;
//样式设置
- (void)setDatePicker:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color;
- (void)setTitleView:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color;
- (void)setLeftButton:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color;
- (void)setRightButton:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color;
- (void)setTitleText:(NSString *)title_text;
- (void)setLeftButtonText:(NSString *)left_text;
- (void)setRightButtonText:(NSString *)right_text;
- (void)setDefault:(NSTimeInterval)date;
- (void)setMinDate:(NSTimeInterval)min_date;
- (void)setMaxDate:(NSTimeInterval)max_date;
- (void)setMinAndMaxDate:(NSTimeInterval)min_date max_date:(NSTimeInterval)max_date;
- (void)setLeftButtonAction:(void (^)(NSTimeInterval result))left_button_action;
- (void)setRightButtonAction:(void (^)(NSTimeInterval result))left_button_action;
@end
@protocol SKAUIDatePickerDelegate <NSObject>
@optional
- (void)willSelectDatePicker:(SKAUIDatePicker *)date_picker date_interval:(NSTimeInterval)date_interval;
@required
- (void)didSelectDatePicker:(SKAUIDatePicker *)date_picker date_interval:(NSTimeInterval)date_interval;
@end
