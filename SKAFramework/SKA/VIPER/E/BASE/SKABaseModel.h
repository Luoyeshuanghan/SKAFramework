//
//  SKABaseModel.h
//  SKAFramework
//
//  Created by JYC on 2017/5/18.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKABaseModel : NSObject
- (void)parseModel:(NSDictionary *)data;
- (NSDictionary *)toDictionary;
@end
