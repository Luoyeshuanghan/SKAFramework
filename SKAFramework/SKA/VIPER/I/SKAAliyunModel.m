//
//  SKAAliyunModel.m
//  啾啾GR
//
//  Created by JZZ on 15/12/22.
//  Copyright © 2015年 Grace. All rights reserved.
//

#import "SKAAliyunModel.h"

@implementation SKAAliyunModel
@end

@implementation SKAAliyunImages
- (instancetype)init:(UIImage *)image{
    self = [super init];
    if (self) {
        self.data = UIImageJPEGRepresentation(image, 0.1);
        self.dir = @"Images";
        self.type = @"jpg";
    }
    return self;
}
@end

@implementation SKAAliyunVideos
- (instancetype)init:(NSData *)videos{
    self = [super init];
    if (self) {
        self.data = videos;
        self.dir = @"Videos";
        self.type = @"mov";
    }
    return self;
}
@end

@implementation SKAAliyunAudios
- (instancetype)init:(NSData *)audios{
    self = [super init];
    if (self) {
        self.data = audios;
        self.dir = @"Audios";
        self.type = @"wav";
    }
    return self;
}

@end
