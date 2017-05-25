//
//  SKAAliyunModel.h
//  啾啾SKA
//
//  Created by JZZ on 15/12/22.
//  Copyright © 2015年 Grace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKAAliyunModel : NSObject
@property (nonatomic, strong) NSData * data;
@property (nonatomic, strong) NSString * dir;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * url_path;
@end

@interface SKAAliyunImages : SKAAliyunModel
- (instancetype)init:(UIImage *)image;
@end

@interface SKAAliyunVideos : SKAAliyunModel
- (instancetype)init:(NSData *)videos;
@end

@interface SKAAliyunAudios : SKAAliyunModel
-(instancetype)init:(NSData *)audios;
@end
