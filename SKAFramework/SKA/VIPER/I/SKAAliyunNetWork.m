//
//  SKAAliyunNetWork.m
//  啾啾GR
//
//  Created by JZZ on 15/12/22.
//  Copyright © 2015年 Grace. All rights reserved.
//

#import "SKAAliyunNetWork.h"
#import <AliyunOSSiOS/OSSService.h>
#import <AliyunOSSiOS/OSSCompat.h>

NSString * const endPoint = @"https://oss-cn-hangzhou.aliyuncs.com";
NSString * const multipartUploadKey = @"multipartUploadObject";

@implementation SKAAliyunNetWork{
    NSInteger image_index;
}
OSSClient * client;

- (instancetype)init{
    self = [super init];
    if (self) {
        [OSSLog disableLog];
        [self initLocalFile];
        [self initOSSClient];
    }
    return self;
}

- (void)initOSSClient {
    // 构造一个获取STSToken的凭证提供器
    id<OSSCredentialProvider> credential = [[OSSFederationCredentialProvider alloc] initWithFederationTokenGetter:^OSSFederationToken * {
        // 实现一个函数，同步返回从server获取到的STSToken
        return [SKASts sharedInstance].federation_token;
    }];
    OSSClientConfiguration * conf = [OSSClientConfiguration new];
    conf.maxRetryCount = 2;
    conf.timeoutIntervalForRequest = 30;
    conf.timeoutIntervalForResource = 24 * 60 * 60;
    client = [[OSSClient alloc] initWithEndpoint:endPoint credentialProvider:credential clientConfiguration:conf];
}

// get local file dir which is readwrite able
- (NSString *)getDocumentDirectory {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

// create some random file for demo cases
- (void)initLocalFile {
    NSFileManager * fm = [NSFileManager defaultManager];
    NSString * mainDir = [self getDocumentDirectory];
    
    NSArray * fileNameArray = @[@"file1k", @"file10k", @"file100k", @"file1m", @"file10m", @"fileDirA/", @"fileDirB/"];
    NSArray * fileSizeArray = @[@1024, @10240, @102400, @1024000, @10240000, @1024, @1024];
    
    NSMutableData * basePart = [NSMutableData dataWithCapacity:1024];
    for (int i = 0; i < 1024/4; i++) {
        u_int32_t randomBit = arc4random();
        [basePart appendBytes:(void*)&randomBit length:4];
    }
    
    for (int i = 0; i < [fileNameArray count]; i++) {
        NSString * name = [fileNameArray objectAtIndex:i];
        long size = [[fileSizeArray objectAtIndex:i] longValue];
        NSString * newFilePath = [mainDir stringByAppendingPathComponent:name];
        if ([fm fileExistsAtPath:newFilePath]) {
            [fm removeItemAtPath:newFilePath error:nil];
        }
        [fm createFileAtPath:newFilePath contents:nil attributes:nil];
        NSFileHandle * f = [NSFileHandle fileHandleForWritingAtPath:newFilePath];
        for (int k = 0; k < size/1024; k++) {
            [f writeData:basePart];
        }
        [f closeFile];
    }
}

+ (NSMutableArray *)GetStringWithSKAAliyunModelArray:(NSMutableArray<SKAAliyunModel *> *)array{
    NSMutableArray * arr =[NSMutableArray new];
    NSString *path = @"";
    for (SKAAliyunModel *model in array) {
        path = [NSString stringWithFormat:@"%@", model.url_path];
        [arr addObject:path];
    }
    return arr;
}

- (void)uploadObjectArrayAsync:(NSMutableArray<SKAAliyunModel *> *)array success:(void (^)(NSMutableArray<SKAAliyunModel *> * return_array))success faild:(void (^)(NSString *error_code))faild upload_progress:(void (^)(float progress))upload_progress{
    if(image_index == [array count]){
        success(array);return;
    }
    [self uploadObjectAsync:array[image_index] success:^(SKAAliyunModel *return_model) {
        ++ image_index;
        [self uploadObjectArrayAsync:array success:success faild:faild upload_progress:upload_progress];
    } faild:^(NSString *error_code) {
        image_index = 0;
        faild(error_code);
        return;
    } upload_progress:upload_progress];
}

- (void)uploadObjectAsync:(SKAAliyunModel *)model success:(void (^)(SKAAliyunModel * return_model))success faild:(void (^)(NSString *error_code))faild upload_progress:(void (^)(float proess))upload_progress{
    if (![[SKASts sharedInstance] isExpired]){
//        [[SKAStsInterface new] POST:nil param:nil success:^(id data) {
//            [self uploadAliyun:model success:success faild:faild upload_proess:upload_proess];
//        } null:nil model:@"SKASStsModel"];
    } else {
        [self uploadAliyun:model success:success faild:faild upload_progress:upload_progress];
    }
}

- (void)uploadAliyun:(SKAAliyunModel *)model success:(void (^)(SKAAliyunModel * return_model))success faild:(void (^)(NSString *error_code))faild upload_progress:(void (^)(float proess))upload_progress{
    OSSPutObjectRequest * put = [OSSPutObjectRequest new];
    
    put.bucketName = ALI_BASE_BUCKET;
    put.objectKey = [NSString stringWithFormat:@"images/%@/%@/%d%tu.%@",model.dir, [NSDate SKAIntervalToStringFormat:[NSDate SKAGetNowInterval] dateFormat:@"yyyy/MM/dd"], (int)[NSDate SKAGetNowInterval], [SKANumber GetRandom:1000 to:9999], model.type];
    put.uploadingData = model.data;
    
    model.url_path = put.objectKey;
    
    put.uploadProgress = ^(int64_t bytesSent, int64_t totalByteSent, int64_t totalBytesExpectedToSend) {
//        NSLog(@"%lld, %lld, %lld", bytesSent, totalByteSent, totalBytesExpectedToSend);
        upload_progress((totalByteSent * 1.0)/(totalBytesExpectedToSend * 1.0));
    };
    
    OSSTask * putTask = [client putObject:put];
    
    [putTask continueWithBlock:^id(OSSTask *task) {
        if (!task.error) {
            NSLog(@"upload object success!");
            success(model);
        } else {
            NSLog(@"upload object failed, error: %@" , task.error);
            faild([NSString stringWithFormat:@"%@", task.error]);
        }
        return nil;
    }];
}

@end
