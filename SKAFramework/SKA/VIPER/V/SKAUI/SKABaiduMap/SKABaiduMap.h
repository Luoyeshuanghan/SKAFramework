//
//  SKABaiduMap.h
//  SKAFramework
//
//  Created by JZZ on 2017/2/4.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKABaiduMapAnnotationView.h"
#import "SKABaiduMapAnnotationModel.h"

typedef NS_ENUM(NSInteger, SKABaiduMapNaviType){
    SKABaiduMapNaviTypeByDrive,
    SKABaiduMapNaviTypeByBus,
    SKABaiduMapNaviTypeByWalk,
};

@interface SKABaiduMap : UIView <BMKMapViewDelegate, BMKLocationServiceDelegate, BMKGeoCodeSearchDelegate>
@property (nonatomic, strong) BMKMapView * mv_mapView;/**< 地图 */
@property (nonatomic, assign) CLLocationCoordinate2D SKA_coordinate;/**< 用户当前坐标 */
@property (nonatomic, assign) id mv_delegate;/**< SKA百度地图代理 */
/**
 更新当前地图中点
 */
- (void)setCenterWithUserLocation;
/**
 设置中点为用户当前坐标并在地理位置更新后进行回调(此处没用delegate的原因是:我不喜欢)
 
 @param center 回调函数
 */
- (void)setCenterWithUserLocation:(void (^)(void))center;
/**
 打开百度地图客户端导航
 
 @param end_point 终点
 @param endPoint_title 终点标题
 */
- (void)openBaiduMapClientNavi:(CLLocationCoordinate2D)end_point endPoint_title:(NSString *)endPoint_title navi_type:(SKABaiduMapNaviType)navi_type;

// 添加动画Annotation
- (void)addSKAAnnotation:(SKABaiduMapAnnotationModel *)SKA_anno_m;
// 删除Annotation
- (void)removeSKAAnnotation:(SKABaiduMapAnnotationModel *)SKA_anno_m;
// 删除一组Annotation
- (void)removeSKAAnnotations:(NSArray<SKABaiduMapAnnotationModel *> *)SKA_anno_arr;
/**
 根据坐标获取地址
 
 @param coor 坐标
 @param address_result 回调(别问我为什么不用Delegate)
 */
- (void)getAddress:(CLLocationCoordinate2D)coor address_block:(void (^)(NSString * address))address_result;
@end
