//
//  SKAUIDatePicker.m
//  啾啾健康版
//
//  Created by JZZ on 2017/3/9.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKAUIDatePicker.h"

@interface SKAUIDatePicker ()
@property (nonatomic, strong) UIButton * cancel_button;
@property (nonatomic, strong) UIView * main_bottom_view;
@property (nonatomic, strong) UIView * title_view;
@property (nonatomic, strong) UILabel * title_label;
@property (nonatomic, strong) UIButton * title_left_button;
@property (nonatomic, strong) UIButton * title_right_button;
@property (nonatomic, strong) UIDatePicker * date_picker;
@property (nonatomic, strong) NSString * obj_set_string;
//左侧按钮点击事件 返回选中内容 默认为空
@property (nonatomic, strong) void (^left_button_action)(NSTimeInterval);
//右侧按钮点击事件 返回选中内容 默认为空
@property (nonatomic, strong) void (^right_button_action)(NSTimeInterval);

@property (nonatomic, strong) UIButton * bn_confirm;/**< 确定 */
@end

@implementation SKAUIDatePicker
//初始化并设置默认样式
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self SKA_bg:SKA_SAME_COLOR_ALPHA(0, 0.5)];
        
        self.cancel_button = ({
            UIButton * bn = [UIButton SKA_initAR:0 y:0 w:375 h:667];
            [bn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
            bn;
        });
        [self SKA_addSV:self.cancel_button, nil];
        self.main_bottom_view = ({
            UIView * ui = [UIView new];
            ui;
        });
        [self SKA_addSV:self.main_bottom_view, nil];
        [self.main_bottom_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(@0);
            make.height.equalTo(self.mas_height).multipliedBy(0.45);
        }];
        
        self.title_view = [UIView new];
        [self.main_bottom_view addSubview:self.title_view];
        [self.title_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.top.equalTo(self.main_bottom_view.mas_top);
            make.right.equalTo(self.mas_right);
            make.height.mas_equalTo(SKAH(64));
        }];
        
        self.title_label = [UILabel new];
        [self.title_label SKA_centerAlign];
        [self.title_view addSubview:self.title_label];
        [self.title_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.title_view);
        }];
        
        self.title_left_button = [UIButton new];
        [self.title_view addSubview:self.title_left_button];
        [self.title_left_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SKAW(16));
            make.top.mas_equalTo(SKAH(16));
            make.width.mas_equalTo(SKAW(44));
            make.bottom.mas_equalTo(SKAH(-16));
        }];
        self.title_right_button = [UIButton new];
        [self.title_view addSubview:self.title_right_button];
        [self.title_right_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(SKAW(-16));
            make.top.mas_equalTo(SKAH(16));
            make.width.mas_equalTo(SKAW(44));
            make.bottom.mas_equalTo(SKAH(-16));
        }];
        
        self.date_picker = [UIDatePicker new];
        self.date_picker.datePickerMode = UIDatePickerModeDate;
        [self.main_bottom_view addSubview:self.date_picker];
        [self.date_picker addTarget:self action:@selector(willSelectDatePicker:) forControlEvents:UIControlEventValueChanged];
        [self.date_picker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.top.equalTo(self.title_view.mas_bottom);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(self.mas_height).multipliedBy(0.25);
        }];
        
        [self initDefaultCSS];
    }
    return self;
}
/**
 初始化样式 可重写
 */
- (void)initDefaultCSS{
    [self.main_bottom_view SKA_bg:SKAUIDATEPICKER_DATEPICKER_BG_COLOR];
    
    [self setDatePicker:SKAUIDATEPICKER_DATEPICKER_BG_COLOR font_size:SKAUIDATEPICKER_DATEPICKER_FONT_SIZE text_color:SKAUIDATEPICKER_DATEPICKER_TEXT_COLOR];
    [self setTitleView:SKAUIDATEPICKER_TITLE_BG_COLOR font_size:SKAUIDATEPICKER_TITLE_FONT_SIZE text_color:SKAUIDATEPICKER_TITLE_TEXT_COLOR];
//    [self setLeftButton:SKAUIDATEPICKER_LEFT_BUTTON_BG_COLOR font_size:SKAUIDATEPICKER_LEFT_BUTTON_FONT_SIZE text_color:SKAUIDATEPICKER_LEFT_BUTTON_TEXT_COLOR];
//    [self setRightButton:SKAUIDATEPICKER_RIGHT_BUTTON_BG_COLOR font_size:SKAUIDATEPICKER_RIGHT_BUTTON_FONT_SIZE text_color:SKAUIDATEPICKER_RIGHT_BUTTON_TEXT_COLOR];
//    [self setLeftButtonText:SKAUIDATEPICKER_LEFT_BUTTON_TEXT];
//    [self setRightButtonText:SKAUIDATEPICKER_RIGHT_BUTTON_TEXT];
    [self.title_right_button SKA_imageNamed:@"General_picker_view_close"];
    
    __weak typeof(self) ws = self;
    [self setLeftButtonAction:^(NSTimeInterval result) {
        [ws cancel];
    }];
    [self setRightButtonAction:^(NSTimeInterval result) {
        [ws cancel];
    }];
    
    self.left_button_enable = NO;
    
    self.bn_confirm = ({
        UIButton * bn = [UIButton new];
        bn.backgroundColor = SKA_COLOR(252, 192, 89);
        [bn SKA_layerRadius:SKAW(26)];
        [bn SKA_title:GL(@"General_confirm")];
        [bn addTarget:self action:@selector(finish) forControlEvents:UIControlEventTouchUpInside];
        bn;
    });
    [self.main_bottom_view addSubview:self.bn_confirm];
    [self.bn_confirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.date_picker.mas_centerX);
        make.bottom.mas_equalTo(SKAH(-15));
        make.width.mas_equalTo(SKAW(231));
        make.height.mas_equalTo(SKAW(52));
    }];
}
/**
 设置UIDATEPICKER样式
 
 @param bg_color   背景颜色
 @param font_size  字体字号
 @param text_color 字体颜色
 */
- (void)setDatePicker:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color{
    self.date_picker.backgroundColor = bg_color;
    self.picker_view_font_size = font_size;
    self.picker_view_text_color = text_color;
}

/**
 设置头部View样式
 
 @param bg_color   背景颜色
 @param font_size  字体字号
 @param text_color 字体颜色
 */
- (void)setTitleView:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color{
    self.title_view.backgroundColor = bg_color;
    self.title_label.font = [UIFont systemFontOfSize:font_size];
    self.title_label.textColor = text_color;
}
/**
 设置左侧按钮样式
 
 @param bg_color   背景颜色
 @param font_size  字体字号
 @param text_color 字体颜色
 */
- (void)setLeftButton:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color{
    self.title_left_button.backgroundColor = bg_color;
    self.title_left_button.titleLabel.font = [UIFont systemFontOfSize:font_size];
    [self.title_left_button setTitleColor:text_color forState:UIControlStateNormal];
}
/**
 设置右侧按钮样式
 
 @param bg_color   背景颜色
 @param font_size  字体字号
 @param text_color 字体颜色
 */
- (void)setRightButton:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color{
    self.title_right_button.backgroundColor = bg_color;
    self.title_right_button.titleLabel.font = [UIFont systemFontOfSize:font_size];
    [self.title_right_button setTitleColor:text_color forState:UIControlStateNormal];
}
/**
 设置标题文字 默认为空
 
 @param title_text 标题
 */
- (void)setTitleText:(NSString *)title_text{
    self.title_label.text = title_text;
}
/**
 设置左侧按钮文本 默认为空
 
 @param left_text 文本
 */
- (void)setLeftButtonText:(NSString *)left_text{
    [self.title_left_button setTitle:left_text forState:UIControlStateNormal];
}
/**
 设置右侧按钮文本 默认为空
 
 @param right_text 文本
 */
- (void)setRightButtonText:(NSString *)right_text{
    [self.title_right_button setTitle:right_text forState:UIControlStateNormal];
}
/**
 设置左侧按钮点击事件
 
 @param left_button_action 左侧点击事件block
 */
- (void)setLeftButtonAction:(void (^)(NSTimeInterval result))left_button_action{
    self.left_button_action = left_button_action;
    [self.title_left_button addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
}
/**
 当前页左侧按钮点击事件 不对外公开
 */
- (void)leftAction{
    dispatch_async(dispatch_get_main_queue(),^{
        self.left_button_action([self.date_picker.date timeIntervalSince1970]);
    });
}
/**
 设置右侧按钮点击事件
 
 @param right_button_action 右侧点击事件block
 */
- (void)setRightButtonAction:(void (^)(NSTimeInterval result))right_button_action{
    self.right_button_action = right_button_action;
    [self.title_right_button addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
}
/**
 当前页右侧按钮点击事件 不对外公开
 */
- (void)rightAction{
    dispatch_async(dispatch_get_main_queue(),^{
        self.right_button_action([self.date_picker.date timeIntervalSince1970]);
    });
}

/**
 关闭当前UIDATEPICKER
 */
- (void)cancel{
    dispatch_async(dispatch_get_main_queue(),^{
        //将SKAUIDATEPICKER从上一视图中移除
        [self removeFromSuperview];
    });
}
/**
 点击完成 调用完成并关闭
 */
- (void)finish{
    [self didSelectDatePicker:self.date_picker];
}

/**
 设置左侧按钮是否可用
 
 @param left_button_enable 是否可用
 */
- (void)setLeft_button_enable:(BOOL)left_button_enable{
    _left_button_enable = left_button_enable;
    self.title_left_button.enabled = left_button_enable;
    self.title_left_button.hidden = !left_button_enable;
}
/**
 设置右侧按钮是否可用
 
 @param right_button_enable 是否可用
 */
- (void)setRight_button_enable:(BOOL)right_button_enable{
    _right_button_enable = right_button_enable;
    self.title_right_button.enabled = right_button_enable;
    self.title_right_button.hidden = !right_button_enable;
}

- (void)setDefault:(NSTimeInterval)date{
    [self.date_picker setDate:[NSDate dateWithTimeIntervalSince1970:date] animated:NO];
}
- (void)setMinDate:(NSTimeInterval)min_date{
    [self.date_picker setMinimumDate:[NSDate dateWithTimeIntervalSince1970:min_date]];
}
- (void)setMaxDate:(NSTimeInterval)max_date{
    [self.date_picker setMaximumDate:[NSDate dateWithTimeIntervalSince1970:max_date]];
}
- (void)setMinAndMaxDate:(NSTimeInterval)min_date max_date:(NSTimeInterval)max_date{
    [self setMinDate:min_date];
    [self setMaxDate:max_date];
}

- (void)willSelectDatePicker:(UIDatePicker *)date_picker{
    dispatch_async(dispatch_get_main_queue(),^{
        //调用Delegate->didSelectDATEPICKER方法
        if ([self.datePicker_delegate respondsToSelector:NSSelectorFromString(@"willSelectDatePicker:date_interval:")]){
            [self.datePicker_delegate willSelectDatePicker:self date_interval:[self.date_picker.date timeIntervalSince1970]];
            //关闭当前SKAUIDATEPICKER
            [self cancel];
        }
    });
}

- (void)didSelectDatePicker:(UIDatePicker *)date_picker{
    dispatch_async(dispatch_get_main_queue(),^{
        //调用Delegate->didSelectDATEPICKER方法
        if ([self.datePicker_delegate respondsToSelector:NSSelectorFromString(@"didSelectDatePicker:date_interval:")]){
            [self.datePicker_delegate didSelectDatePicker:self date_interval:[date_picker.date timeIntervalSince1970]];
            NSLog(@"%tu", [self.date_picker.date timeIntervalSince1970]);
            SKALog(@"%@", self.date_picker.date);
            //关闭当前SKAUIDATEPICKER
            [self cancel];
        }
    });
}

@end
