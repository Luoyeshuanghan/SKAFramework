//
//  UILabel+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "UILabel+SKA.h"

@implementation UILabel (SKA)
- (void)SKA_shadow:(CGSize)size color:(UIColor *)shadow_color{
    self.shadowOffset = size;
    self.shadowColor = shadow_color;
}
- (void)SKA_fs:(float)size{
    self.font = [UIFont systemFontOfSize:size];
}
- (void)SKA_centerAlign{
    self.textAlignment = NSTextAlignmentCenter;
}
- (void)SKA_leftAlign{
    self.textAlignment = NSTextAlignmentLeft;
}
- (void)SKA_rightAlign{
    self.textAlignment = NSTextAlignmentRight;
}
- (void)SKA_textColor:(UIColor *)color{
    self.textColor = color;
}
- (void)SKA_nobr{
    self.lineBreakMode = NSLineBreakByWordWrapping;
}
- (void)SKA_lineHeight:(float)height{
    if (self.text == nil){
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing              = height;   //行高
    NSDictionary *attributes                = @{NSParagraphStyleAttributeName:paragraphStyle};
    NSAttributedString *atStr               = [[NSAttributedString alloc]initWithString:self.text attributes:attributes];
    //赋值
    self.attributedText                    = atStr;
    self.lineBreakMode = NSLineBreakByCharWrapping;
}
- (void)SKA_autoWidth{
    [self setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
}
- (void)SKA_autoHeight{
    [self setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}
@end
