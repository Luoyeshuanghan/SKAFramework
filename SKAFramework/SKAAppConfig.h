//
//  SKAAppConfig.h
//  SKAFramework
//
//  Created by JZZ on 2016/12/19.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#ifndef SKAAppConfig_h
#define SKAAppConfig_h

#pragma mark - 常用宏
// 操作系统版本号
#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])

// 是否横竖屏
// 用户界面横屏了才会返回YES
#define IS_LANDSCAPE UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])
// 无论支不支持横屏，只要设备横屏了，就会返回YES
#define IS_DEVICE_LANDSCAPE UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])

// 屏幕宽度，跟横竖屏无关
#define DEVICE_WIDTH (IOS_VERSION >= 8.0 ? (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width) : [[UIScreen mainScreen] bounds].size.width)

// 屏幕高度，跟横竖屏无关
#define DEVICE_HEIGHT (IOS_VERSION >= 8.0 ? (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height) : [[UIScreen mainScreen] bounds].size.height)

//国际化
#undef GL
#define GL(key) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]
//单例创建
#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

#endif /* SKAAppConfig_h */
