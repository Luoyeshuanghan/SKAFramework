//
//  SKATableViewSectionView.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKATableViewSectionView.h"

@interface SKATableViewSectionView()
@property (nonatomic, strong) SKATableViewSectionModel * section_model;
@property (nonatomic, strong) NSString * section_action_name;
@end

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
@implementation SKATableViewSectionView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSectionView];
    }
    return self;
}
- (void)initSectionView{}
- (void)initView:(id)delegate model:(SKATableViewSectionModel *)model{
    self.delegate = delegate;
    self.section_model = model;
    [self initView:model];
}
- (void)initView:(SKATableViewSectionModel *)model{}
#pragma mark - 增加按钮事件
- (void)addSectionAction:(UIButton *)button action_name:(NSString *)action_name{
    self.section_action_name = [action_name stringByAppendingString:@":"];
    [button addTarget:self action:@selector(section_button_action) forControlEvents:UIControlEventTouchUpInside];
}
- (void)section_button_action{
    if([self.delegate respondsToSelector:NSSelectorFromString(self.section_action_name)]){
        [self.delegate performSelector:NSSelectorFromString(self.section_action_name) withObject:self.section_model];
    } else {
        NSLog(@"ERROR:请在%@类中实现<-(void)%@(%@ *)model>方法", [self.delegate class], self.section_action_name, NSStringFromClass([self.section_model class]));
    }
}
@end
