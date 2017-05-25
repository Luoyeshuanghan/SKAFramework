//
//  SKATableViewCell.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKATableViewCell.h"

@interface SKATableViewCell()
@property (nonatomic, strong) NSString * cell_action_name;
@end

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
@implementation SKATableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self initCell];
    }
    
    return self;
}

- (void)initCell{}

- (void)initView:(id)delegate model:(SKATableViewModel *)model{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.delegate = delegate;
    self.cell_model = model;
    [self initView:model];
}

- (void)initView:(SKATableViewModel *)model{}

#pragma mark - 增加Cell点击事件事件
- (void)addCellAction:(NSString *)action_name{
    if (action_name == nil || [action_name isEqualToString:@""]){
        return;
    }
    
    action_name = [action_name stringByAppendingString:@":"];
    
    if([self.delegate respondsToSelector:NSSelectorFromString(action_name)]){
        [self.delegate performSelector:NSSelectorFromString(action_name) withObject:self.cell_model];
    } else {
        NSLog(@"ERROR:请在%@类中实现<-(void)%@(%@ *)model>方法", [self.delegate class], action_name, NSStringFromClass([self.cell_model class]));
    }
    self.cell_action_name = [action_name stringByAppendingString:@":"];
}
- (void)addCellAction:(NSString *)action_name model:(id)model{
    if (action_name == nil || [action_name isEqualToString:@""]){
        return;
    }
    
    action_name = [action_name stringByAppendingString:@":"];
    
    if([self.delegate respondsToSelector:NSSelectorFromString(action_name)]){
        [self.delegate performSelector:NSSelectorFromString(action_name) withObject:model];
    } else {
        NSLog(@"ERROR:请在%@类中实现<-(void)%@(%@ *)model>方法", [self.delegate class], action_name, NSStringFromClass([model class]));
    }
    self.cell_action_name = [action_name stringByAppendingString:@":"];
}
#pragma mark - 增加按钮事件
- (void)addCellAction:(UIButton *)button action_name:(NSString *)action_name{
    if (button == nil || [button isEqual:[NSNull null]] ||action_name == nil || [action_name isEqualToString:@""]){
        return;
    }
    self.cell_action_name = [action_name stringByAppendingString:@":"];
    [button addTarget:self action:@selector(cell_button_action) forControlEvents:UIControlEventTouchUpInside];
}
- (void)cell_button_action{
    if ([self.cell_action_name isEqualToString:@""] || self.cell_model == nil){
        return;
    }
    
    if([self.delegate respondsToSelector:NSSelectorFromString(self.cell_action_name)]){
        [self.delegate performSelector:NSSelectorFromString(self.cell_action_name) withObject:self.cell_model];
    } else {
        NSLog(@"ERROR:请在%@类中实现<-(void)%@(%@ *)model>方法", [self.delegate class], self.cell_action_name, NSStringFromClass([self.cell_model class]));
    }
}


@end
