//
//  SKABaiduMapAnnotationModel.m
//  SKAFramework
//
//  Created by JZZ on 2017/2/4.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKABaiduMapAnnotationModel.h"

@implementation SKABaiduMapAnnotationModel
- (NSString *)cell_name{
    return [NSStringFromClass([self class]) SKAReplace:@"Model" with_str:@"View"];
}
@end
