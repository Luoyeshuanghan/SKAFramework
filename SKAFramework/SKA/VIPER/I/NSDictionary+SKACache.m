//
//  NSDictionary+SKACache.m
//  20161011Test
//
//  Created by JZZ on 2016/11/14.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "NSDictionary+SKACache.h"

@implementation NSDictionary (SKACache)
//字典转json
- (NSString*)DataToJsonString{
    NSString * jsonString = nil;
    NSError * error;
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    }
    return jsonString;
}
@end
