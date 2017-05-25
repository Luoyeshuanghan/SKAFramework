//
//  NSMutableArray+SKAAliModel.m
//  啾啾GR
//
//  Created by Grace on 15/12/23.
//  Copyright © 2015年 Grace. All rights reserved.
//

#import "NSMutableArray+SKAAliModel.h"

@implementation NSMutableArray (SKAAliModel)
- (void)initWithSKAAliModel:(NSMutableArray *)array{
    for (UIImage * image in array) {
        [self addObject:[[SKAAliyunImages alloc] init:image]];
    }
}
@end
