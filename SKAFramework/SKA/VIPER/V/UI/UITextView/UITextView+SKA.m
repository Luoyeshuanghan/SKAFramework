//
//  UITextView+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "UITextView+SKA.h"

#define SKA_UITEXTVIEW_PLACEHOLDER_TAG 100000

@implementation UITextView (SKA)
- (void)SKA_fs:(float)size{
    self.font = [UIFont systemFontOfSize:size];
}
- (void)SKA_textColor:(UIColor *)color{
    self.textColor = color;
}
- (void)SKA_leftAlign{
    self.textAlignment = NSTextAlignmentLeft;
}
- (void)SKA_centerAlign{
    self.textAlignment = NSTextAlignmentCenter;
}
- (void)SKA_rightAlign{
    self.textAlignment = NSTextAlignmentRight;
}
- (void)SKA_lineHeight:(float)height{
    if (self.text == nil){
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing              = height;   //行高
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes                = @{NSParagraphStyleAttributeName:paragraphStyle};
    NSAttributedString *atStr               = [[NSAttributedString alloc]initWithString:self.text attributes:attributes];
    //赋值
    self.attributedText                    = atStr;
}
- (void)SKA_placeHolder:(NSString *)text{
    UILabel * lb_placeHolder = ({
        UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        lb.font = self.font;
        lb.textColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.8];
        lb.numberOfLines = 0;
        lb.text = text;
        lb.tag = SKA_UITEXTVIEW_PLACEHOLDER_TAG;
        CGSize size = CGSizeMake(lb.SKA_w, 3000);
        CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:lb.font} context:nil];
        lb.SKA_h = rect.size.height;
        lb;
    });
    [self addSubview:lb_placeHolder];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SKA_hidePlaceHolder) name:UITextViewTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SKA_showPlaceHolder) name:UITextViewTextDidEndEditingNotification object:nil];
}
- (void)SKA_hidePlaceHolder{
    for (UIView * ui in self.subviews){
        if (ui.tag == SKA_UITEXTVIEW_PLACEHOLDER_TAG){
            ui.hidden = YES;
        }
    }
}
- (void)SKA_showPlaceHolder{
    if ([self.text isEqualToString:@""]){
        for (UIView * ui in self.subviews){
            if (ui.tag == SKA_UITEXTVIEW_PLACEHOLDER_TAG){
                ui.hidden = NO;
            }
        }
    }
}
@end
