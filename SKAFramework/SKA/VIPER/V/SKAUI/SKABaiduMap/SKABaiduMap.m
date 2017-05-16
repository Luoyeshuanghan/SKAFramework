//
//  SKABaiduMap.m
//  SKAFramework
//
//  Created by JZZ on 2017/2/4.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKABaiduMap.h"

@interface SKABaiduMap (){
    NSInteger loc_number;/**< */
    
    BMKLocationService * loc_service;/**< 当前坐标服务类 */
    BMKPointAnnotation* animatedAnnotation;
    
    void(^center_block)(void);
    void(^address_block)(NSString *);
}
@end

@implementation SKABaiduMap

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.mv_mapView = ({
            BMKMapView * mv = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            mv.delegate = self;
            mv;
        });
        
        [self initMapView];
        [self initLocalService];
        [self addSubview:self.mv_mapView];
    }
    return self;
}

- (void)initMapView{
    self.mv_mapView.showsUserLocation = NO;//先关闭显示的定位图层
    self.mv_mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    self.mv_mapView.showsUserLocation = YES;//显示定位图层
    self.mv_mapView.showsUserLocation = NO;
    self.mv_mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
    self.mv_mapView.showsUserLocation = YES;
}

- (void)initLocalService{
    loc_service = [[BMKLocationService alloc]init];
    loc_service.delegate = self;
    [loc_service startUserLocationService];
}

// 添加动画Annotation
- (void)addSKAAnnotation:(SKABaiduMapAnnotationModel *)SKA_anno_m{
    [self.mv_mapView addAnnotation:SKA_anno_m];
}
// 删除Annotation
- (void)removeSKAAnnotation:(SKABaiduMapAnnotationModel *)SKA_anno_m{
    [self.mv_mapView removeAnnotation:SKA_anno_m];
}
// 删除一组Annotation
- (void)removeSKAAnnotations:(NSArray<SKABaiduMapAnnotationModel *> *)SKA_anno_arr{
    [self.mv_mapView removeAnnotations:SKA_anno_arr];
}

// 根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation{
    NSString *AnnotationViewID = @"SKAAnnotation";
    if ([annotation isKindOfClass:[SKABaiduMapAnnotationModel class]]){
        SKABaiduMapAnnotationModel * anno_m = annotation;
        SKABaiduMapAnnotationView * annotationView = [[NSClassFromString(anno_m.cell_name) alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
        [annotationView initView:self.mv_delegate model:anno_m];
        return annotationView;
    }
    return nil;
    
}

#pragma mark - 更新当前地图中点
/**
 设置loc_number 在需要时增加loc_number以更新用户位置
 */
- (void)setCenterWithUserLocation{
    ++ loc_number;
}
/**
 内部使用，当地理位置更新后调用，如果loc_number>0则更新
 */
- (void)locService_setCenterWithUserLocation{
    if (loc_number > 0){
        [self.mv_mapView setCenterCoordinate:self.SKA_coordinate];
        if (center_block ==nil){}
        else {
            center_block();
        }
        -- loc_number;
    }
}

/**
 设置中点为用户当前坐标并在地理位置更新后进行回调

 @param center 回调函数
 */
- (void)setCenterWithUserLocation:(void (^)(void))center{
    ++ loc_number;
    center_block = center;
}

//打开地图 驾车路线检索
- (void)openBaiduMapClientNavi:(CLLocationCoordinate2D)end_point endPoint_title:(NSString *)endPoint_title navi_type:(SKABaiduMapNaviType)navi_type{
    BMKOpenRouteOption *opt = nil;
    
    if (self.SKA_coordinate.longitude == 0){
//        [SKAHUD warningProgress:@"获取当前地理位置失败，请稍后再试"];
        return;
    }
    
    switch (navi_type) {
        case SKABaiduMapNaviTypeByDrive:
            opt = [[BMKOpenDrivingRouteOption alloc] init];
            break;
        case SKABaiduMapNaviTypeByBus:
            opt = [[BMKOpenTransitRouteOption alloc] init];
            break;
        case SKABaiduMapNaviTypeByWalk:
            opt = [[BMKOpenWalkingRouteOption alloc] init];
            break;
            
        default:
            break;
    }
    
    //    opt.appName = @"SDK调起Demo";
    opt.appScheme = @"baidumapsdk://mapsdk.baidu.com";
    //初始化起点节点
    BMKPlanNode* start = [[BMKPlanNode alloc]init];
    start.pt = self.SKA_coordinate;
    //指定起点名称
    start.name = @"我的位置";
    start.cityName = @"我的位置";
    //指定起点
    opt.startPoint = start;
    
    //初始化终点节点
    BMKPlanNode* end = [[BMKPlanNode alloc]init];
    end.pt = end_point;
    //指定终点名称
    end.name = endPoint_title;
    end.cityName = @"目标位置";
    opt.endPoint = end;
    BMKOpenErrorCode code = 0;
    switch (navi_type) {
        case SKABaiduMapNaviTypeByDrive:
            code  = [BMKOpenRoute openBaiduMapDrivingRoute:(BMKOpenDrivingRouteOption *)opt];
            break;
        case SKABaiduMapNaviTypeByBus:
            code  = [BMKOpenRoute openBaiduMapTransitRoute:(BMKOpenTransitRouteOption *)opt];
            break;
        case SKABaiduMapNaviTypeByWalk:
            code  = [BMKOpenRoute openBaiduMapWalkingRoute:(BMKOpenWalkingRouteOption *)opt];
            break;
            
        default:
            break;
    }
    NSLog(@"%d", code);
    return;
}

#pragma mark - 添加自定义的手势（若不自定义手势，不需要下面的代码）
/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    self.SKA_coordinate = userLocation.location.coordinate;
    [self locService_setCenterWithUserLocation];
}

#pragma mark - 获取地址
/**
 根据坐标获取地址

 @param coor 坐标
 @param address_result 回调
 */
- (void)getAddress:(CLLocationCoordinate2D)coor address_block:(void (^)(NSString * address))address_result{
    BMKGeoCodeSearch * geocodesearch = [[BMKGeoCodeSearch alloc]init];
    geocodesearch.delegate = self;
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeSearchOption.reverseGeoPoint = coor;
    //循环调用直到成功
    dispatch_async(dispatch_queue_create("SKABaiduMapGetAddress", nil), ^{
        int times = 0;
        while(![geocodesearch reverseGeoCode:reverseGeocodeSearchOption] && times < 50){
            NSLog(@"地理反查失败--> %f", coor.latitude);
            ++ times;
            continue;
        };
    });
    
    address_block = address_result;
}
//百度地图地理反查回调
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
    item.coordinate = result.location;
    item.title = result.address;
    address_block(result.address);
}
@end
