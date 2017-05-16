//
//  SKAColorHeader.h
//  SKAFramework
//
//  Created by JZZ on 2016/11/18.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#ifndef SKAColorHeader_h
#define SKAColorHeader_h

#define SKA_CLS [UIColor clearColor]
//带有_ALPHA为可设置透明度
//同样颜色用于各种灰色灰
#define SKA_SAME_COLOR(color) [UIColor colorWithRed:color/255.0 green:color/255.0 blue:color/255.0 alpha:1.0]
#define SKA_SAME_COLOR_ALPHA(color, _alpha) [UIColor colorWithRed:color/255.0 green:color/255.0 blue:color/255.0 alpha:_alpha]
//根据RGB设置颜色
#define SKA_COLOR(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define SKA_COLOR_ALPHA(R,G,B,_alpha) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:_alpha]
//根据十六进制设置颜色
#define SKA_COLOR_16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define SKA_COLOR_16_ALPHA(rgbValue, _alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_alpha]
#endif /* SKAColorHeader_h */
