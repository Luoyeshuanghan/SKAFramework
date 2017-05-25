//
//  SKAAliyunNetWork.h
//  啾啾SKA
//
//  Created by JZZ on 15/12/22.
//  Copyright © 2015年 Grace. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface SKAAliyunNetWork : NSObject
- (void)uploadObjectArrayAsync:(NSMutableArray<SKAAliyunModel *> *)array success:(void (^)(NSMutableArray<SKAAliyunModel *> * return_array))success faild:(void (^)(NSString *error_code))faild upload_progress:(void (^)(float progress))upload_progress;
- (void)uploadObjectAsync:(SKAAliyunModel *)model success:(void (^)(SKAAliyunModel * return_model))success faild:(void (^)(NSString *error_code))faild upload_progress:(void (^)(float progress))upload_progress;
+  (NSMutableArray *)GetStringWithSKAAliyunModelArray:(NSMutableArray<SKAAliyunModel *> *)array;
@end
