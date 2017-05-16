//
//  SKABaiduMapAnnotationView.h
//  SKAFramework
//
//  Created by JZZ on 2017/2/4.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "SKABaiduMapAnnotationModel.h"

@protocol SKABaiduMapAnnotationViewDelegate <NSObject>
@end
@interface SKABaiduMapAnnotationView : BMKAnnotationView
@property (nonatomic, assign) id<SKABaiduMapAnnotationViewDelegate> a_delegate;/**< SKAAnnotation代理 */
- (void)initCell;
- (void)initView:(id)delegate model:(SKABaiduMapAnnotationModel *)model;
- (void)initView:(SKABaiduMapAnnotationModel *)model;
- (void)addCellAction:(NSString *)action_name;
- (void)addCellAction:(NSString *)action_name model:(id)model;
- (void)addCellAction:(UIButton *)btn action_name:(NSString *)action_name;
@end
