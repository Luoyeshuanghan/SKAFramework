//
//  SKAUIPickerView.m
//  MasonryTest
//
//  Created by YC on 16/12/14.
//  Copyright © 2016年 GRD. All rights reserved.
//

#import "SKAUIPickerView.h"
#import "Masonry.h"

@interface SKAUIPickerView()
@property (nonatomic, strong) UIButton * cancel_button;
@property (nonatomic, strong) UIView * main_bottom_view;
@property (nonatomic, strong) UIView * title_view;
@property (nonatomic, strong) UILabel * title_label;
@property (nonatomic, strong) UIButton * title_left_button;
@property (nonatomic, strong) UIButton * title_right_button;
@property (nonatomic, strong) UIPickerView * picker_view;
@property (nonatomic, strong) NSString * obj_set_string;
//左侧按钮点击事件 返回选中内容 默认为空
@property (nonatomic, strong) void (^left_button_action)(id);
//右侧按钮点击事件 返回选中内容 默认为空
@property (nonatomic, strong) void (^right_button_action)(id);

@property (nonatomic, strong) UIButton * bn_confirm;/**< 确定 */
@end
@implementation SKAUIPickerView
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
        
        self.picker_view = [UIPickerView new];
        self.picker_view.delegate = self;
        self.picker_view.dataSource = self;
        [self.main_bottom_view addSubview:self.picker_view];
        [self.picker_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.top.equalTo(self.title_view.mas_bottom);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(self.mas_height).multipliedBy(0.25);
        }];
        
        self.data_component = 1;
        
        [self initDefaultCSS];
    }
    return self;
}
/**
 初始化样式 可重写
 */
- (void)initDefaultCSS{
    [self.main_bottom_view SKA_bg:SKAUIPICKERVIEW_PICKERVIEW_BG_COLOR];
    
    [self setPickerView:SKAUIPICKERVIEW_PICKERVIEW_BG_COLOR font_size:SKAUIPICKERVIEW_PICKERVIEW_FONT_SIZE text_color:SKAUIPICKERVIEW_PICKERVIEW_TEXT_COLOR];
    [self setTitleView:SKAUIPICKERVIEW_TITLE_BG_COLOR font_size:SKAUIPICKERVIEW_TITLE_FONT_SIZE text_color:SKAUIPICKERVIEW_TITLE_TEXT_COLOR];
//    [self setLeftButton:SKAUIPICKERVIEW_LEFT_BUTTON_BG_COLOR font_size:SKAUIPICKERVIEW_LEFT_BUTTON_FONT_SIZE text_color:SKAUIPICKERVIEW_LEFT_BUTTON_TEXT_COLOR];
//    [self setRightButton:SKAUIPICKERVIEW_RIGHT_BUTTON_BG_COLOR font_size:SKAUIPICKERVIEW_RIGHT_BUTTON_FONT_SIZE text_color:SKAUIPICKERVIEW_RIGHT_BUTTON_TEXT_COLOR];
//    [self setLeftButtonText:SKAUIPICKERVIEW_LEFT_BUTTON_TEXT];
//    [self setRightButtonText:SKAUIPICKERVIEW_RIGHT_BUTTON_TEXT];
    [self.title_right_button SKA_imageNamed:@"General_picker_view_close"];
    
    __weak typeof(self) ws = self;
//    [self setLeftButtonAction:^(NSString *result) {
//        [ws cancel];
//    }];
    [self setRightButtonAction:^(NSString *result) {
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
        make.centerX.equalTo(self.picker_view.mas_centerX);
        make.bottom.mas_equalTo(SKAH(-15));
        make.width.mas_equalTo(SKAW(231));
        make.height.mas_equalTo(SKAW(52));
    }];
}
/**
 设置UIPickerView样式

 @param bg_color   背景颜色
 @param font_size  字体字号
 @param text_color 字体颜色
 */
- (void)setPickerView:(UIColor *)bg_color font_size:(NSInteger)font_size text_color:(UIColor *)text_color{
    self.picker_view.backgroundColor = bg_color;
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
- (void)setLeftButtonAction:(void (^)(id result))left_button_action{
    self.left_button_action = left_button_action;
    [self.title_left_button addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
}
/**
 当前页左侧按钮点击事件 不对外公开
 */
- (void)leftAction{
    dispatch_async(dispatch_get_main_queue(),^{
        self.left_button_action([self getObject]);
    });
}
/**
 设置右侧按钮点击事件

 @param right_button_action 右侧点击事件block
 */
- (void)setRightButtonAction:(void (^)(id result))right_button_action{
    self.right_button_action = right_button_action;
    [self.title_right_button addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
}
/**
 当前页右侧按钮点击事件 不对外公开
 */
- (void)rightAction{
    dispatch_async(dispatch_get_main_queue(),^{
        self.right_button_action([self getObject]);
    });
}
/**
 传入NSString数据

 @param data 数据数组
 */
- (void)setData:(NSMutableArray<NSString *> *)data{
    self.data_source = data;
    [self reload_data];
}
/**
 传入复杂数据

 @param obj_data       复杂数据对象 如Object:NSString * id, NSString * name;
 @param obj_set_string 对象显示字段 如name
 */
- (void)setDataWithObject:(NSMutableArray<id> *)obj_data objSetString:(NSString *)obj_set_string{
    self.data_source = obj_data;
    self.obj_set_string = obj_set_string;
    [self reload_data];
}
/**
 设置默认选中内容

 @param default_data 默认选中内容
 */
- (void)setDefaultData:(NSString *)default_data{
    if (default_data != nil){
        [self setDefaultData:default_data key:nil];
    } else {}
}
/**
 设置默认选中内容 key为nil的判断放在getIndexWithData中处理
 
 @param default_data 默认选中内容
 */
- (void)setDefaultData:(id)default_data key:(NSString *)key{
    //获取key所在row
    NSInteger select_row = [self getIndexWithData:self.data_source key:key data:default_data];
    //更新当前选择row
    self.array_row[0] = [NSNumber numberWithInteger:select_row];
    //更新UIPickerView选择行
    [self selectComponent:0 row:select_row];
}
/**
 获取字段位于数组的第几位 如果key为空或对象内不包含

 @param array 数组
 @param key 字段
 @param data  对象

 @return 当前位数
 */
- (NSInteger)getIndexWithData:(NSArray *)array key:(NSString *)key data:(id)data{
    //遍历数组 找出匹配项并返回下标
    for (int i = 0 ; i < array.count ; ++ i){
        //判断key是否为空 若为空则视为以原有对象进行匹配 若不为空则判断对象(array[i])是否包含key 不包含则catch并设置为空
        NSString * values;
        if (key == nil){
            values = array[i];
        } else {
            @try {
                values = [array[i] valueForKey:key];
            } @catch (NSException *exception) {
                values = @"";
                NSLog(@"ERROR:%@对象未包含%@属性", array[i], key);
            }
        }
        
        //判断values是否与data匹配 若匹配则返回当前下标
        if ([values isEqual:data]){
            return i;
        }
    }
    return 0;
}


/**
 刷新数据 不重置UIPickerView
 */
- (void)reload_data{
    //重新设置当前选择项
    for (int i = 0 ; i < self.array_row.count ; ++ i){
        [self selectComponent:i row:[self.array_row[i] integerValue]];
    }
    //更新UIPickerView数据
    [self.picker_view reloadAllComponents];
}
/**
 刷新数据并重置UIPickerView
 */
- (void)reload_all_data{
    //初始化array_row
    for (int i = 0 ; i < self.array_row.count ; ++ i){
        self.array_row[i] = @0;
    }
    //刷新数据
    [self reload_data];
}
/**
 关闭当前UIPickerView
 */
- (void)cancel{
    dispatch_async(dispatch_get_main_queue(),^{
        //将SKAUIPickerView从上一视图中移除
        [self removeFromSuperview];
    });
}
/**
 点击完成 调用完成并关闭
 */
- (void)finish{
    dispatch_async(dispatch_get_main_queue(),^{
        //调用Delegate->didSelectPickerView方法
        if ([self.pickerView_delegate respondsToSelector:NSSelectorFromString(@"didSelectPickerView:result:")]){
            [self.pickerView_delegate didSelectPickerView:self result:[self getObject]];
            //关闭当前SKAUIPickerView
            [self cancel];
        }
    });
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

#pragma mark - UIPickerViewResource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.data_component;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.data_source.count;
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel * label = [UILabel new];
    label.font = [UIFont systemFontOfSize:self.picker_view_font_size];
    label.textColor = self.picker_view_text_color;
    label.textAlignment = NSTextAlignmentCenter;
    //设置label显示内容为从方法获得
    label.text = [self setText:component row:row];
    return label;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //更新当前选择row
    self.array_row[component] = [NSNumber numberWithInteger:row];
    //调用delegate->willSelectPickerView方法并返回指定对象
    if (([self.pickerView_delegate respondsToSelector:NSSelectorFromString(@"willSelectPickerView:result:")])){
        [self.pickerView_delegate willSelectPickerView:self result:[self getObject]];
    }
}
/**
 获取显示文本

 @param component 列
 @param row       行

 @return 显示文本
 */
- (NSString *)setText:(NSInteger)component row:(NSInteger)row{
    //判断SKAUIPickerView构成是否是复杂数组(其实就是判断是否传入了Objectkey) 如果不是复杂数组则视作NSString处理
    NSString * text = self.obj_set_string;
    if (text == nil){
        text = self.data_source[row];
    } else {
        @try {
            text = [self.data_source[row] valueForKey:self.obj_set_string];
        } @catch (NSException *exception) {
            text = @"无";
        }
    }
    
    return text;
}

/**
 获取Object

 @return Object
 */
- (id)getObject{
    //获取单列下SKAUIPickerView所选中的行包含的对象
    return self.data_source[[self.array_row[0] integerValue]];
}

/**
 设置UIPickerView列数并初始化ArrayRow数组

 @param data_component 列数
 */
- (void)setData_component:(NSInteger)data_component{
    _data_component = data_component;
    //如果array_row为空则初始化 否则清空array_row
    if (self.array_row == nil){
        self.array_row = [NSMutableArray new];
    } else {
        [self.array_row removeAllObjects];
    }
    //将array_row循环赋值为0
    for (int i = 0 ; i < data_component ; ++ i){
        [self.array_row addObject:[NSNumber numberWithInt:0]];
    }
}
/**
 设置UIPickerView当前选中行

 @param component 列
 @param row       行
 */
- (void)selectComponent:(NSInteger)component row:(NSInteger)row{
    //将UIPickerView滚动至指定行
    [self.picker_view selectRow:row inComponent:component animated:NO];
}

@end
