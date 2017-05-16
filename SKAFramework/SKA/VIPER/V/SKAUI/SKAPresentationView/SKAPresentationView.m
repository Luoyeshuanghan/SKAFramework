//
//  SKAPresentationView.m
//  SKAFramework
//
//  Created by JYC on 2017/5/15.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "SKAPresentationView.h"

@interface SKAPresentationView()
@property (nonatomic, strong) UIView * ui_wrap;//中央View
@property (nonatomic, strong) UIButton * bn_bg_cancel;//背景关闭按钮
@end

@implementation SKAPresentationView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(0, 0, SKAW(375), SKAH(667))];
    if (self){
        self.bn_bg_cancel = ({
            UIButton * bn = [UIButton SKA_initAR:0 y:0 w:375 h:667];
            [bn SKA_bg:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]];
            [bn SKA_action:self action:@selector(action_cancel)];
            bn;
        });
        [self addSubview:self.bn_bg_cancel];
        self.ui_wrap = ({
            UIView * ui = [[UIView alloc] initWithFrame:frame];
            [self initPresentationView:ui];
            ui;
        });
    }
    return self;
}
- (void)initPresentationView:(UIView *)ui_wrap{}
#pragma mark - Function
- (void)show{
    
}
- (void)hide{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}
#pragma mark - Action
- (void)action_cancel{
    [self hide];
}
@end
