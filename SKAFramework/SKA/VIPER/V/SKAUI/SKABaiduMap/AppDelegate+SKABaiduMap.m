//
//  AppDelegate+SKABaiduMap.m
//  SKAFramework
//
//  Created by JZZ on 2017/2/4.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "AppDelegate+SKABaiduMap.h"

BMKMapManager* _mapManager;
@implementation AppDelegate (SKABaiduMap)
- (void)SKA_initBaiduMap{
    //要使用百度地图，请先启动BaiduMapManager
    _mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:@"UGybWHfldzpqPjyANf65FfVmyPujvDd7" generalDelegate:self];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
}

- (void)onGetNetworkState:(int)iError{
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
    
}

- (void)onGetPermissionState:(int)iError{
    if (0 == iError) {
        NSLog(@"授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
}
@end
