//
//  SKABaiduMapAnnotationModel.h
//  SKAFramework
//
//  Created by JZZ on 2017/2/4.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface SKABaiduMapAnnotationModel : BMKPointAnnotation
@property (nonatomic, strong) NSString * cell_name;/**< 布局名称 */
@end
