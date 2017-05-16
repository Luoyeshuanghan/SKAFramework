//
//  SKABaiduMapAnnotationView.m
//  SKAFramework
//
//  Created by JZZ on 2017/2/4.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKABaiduMapAnnotationView.h"

@interface SKABaiduMapAnnotationView ()
@property (nonatomic, strong) NSString * cell_action_name;
@property (nonatomic, strong) SKABaiduMapAnnotationModel * cell_model;
@end

@implementation SKABaiduMapAnnotationView
- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCell];
    }
    return self;
}
- (void)initCell{}
- (void)initView:(SKABaiduMapAnnotationModel *)model{}
- (void)initView:(id)delegate model:(SKABaiduMapAnnotationModel *)model{
    self.a_delegate = delegate;
    self.cell_model = model;
    [self initView:model];
}

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
#pragma mark - 增加Cell点击事件事件
- (void)addCellAction:(NSString *)action_name{
    UIButton * btn = ({
        UIButton * bn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        bn;
    });
    [self SKA_addSV:btn, nil];
    [self addCellAction:btn action_name:action_name];
}
- (void)addCellAction:(NSString *)action_name model:(id)model{
    if (action_name == nil || [action_name isEqualToString:@""]){
        return;
    }
    
    action_name = [action_name stringByAppendingString:@":"];
    
    if([self.a_delegate respondsToSelector:NSSelectorFromString(action_name)]){
        [self.a_delegate performSelector:NSSelectorFromString(action_name) withObject:model];
    } else {
        NSLog(@"ERROR:请在%@类中实现<-(void)%@(%@ *)model>方法", [self.a_delegate class], action_name, NSStringFromClass([model class]));
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
    
    if([self.a_delegate respondsToSelector:NSSelectorFromString(self.cell_action_name)]){
        [self.a_delegate performSelector:NSSelectorFromString(self.cell_action_name) withObject:self.cell_model];
    } else {
        NSLog(@"ERROR:请在%@类中实现<-(void)%@(%@ *)model>方法", [self.a_delegate class], self.cell_action_name, NSStringFromClass([self.cell_model class]));
    }
}
@end
