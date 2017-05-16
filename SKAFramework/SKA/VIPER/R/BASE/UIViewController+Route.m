//
//  UIViewController+Route.m
//  SKAFramework
//
//  Created by JYC on 2017/5/15.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "UIViewController+Route.h"
#import <objc/runtime.h>

static void * SKAPushInNaviStateKey = (void *)@"SKAPushInNaviStateKey";
static void * SKAPushInTabbarStateKey = (void *)@"SKAPushInTabbarStateKey";
@implementation UIViewController (Route)
@dynamic SKAPushInNaviState, SKAPushInTabbarState;
- (void)setSKAPushInNaviState:(BOOL)SKAPushInNaviState{
    objc_setAssociatedObject(self, SKAPushInNaviStateKey, [NSNumber numberWithBool:SKAPushInNaviState], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)SKAPushInNaviState{
    return [objc_getAssociatedObject(self, SKAPushInNaviStateKey) intValue];
}
- (void)setSKAPushInTabbarState:(BOOL)SKAPushInTabbarState{
    objc_setAssociatedObject(self, SKAPushInTabbarStateKey, [NSNumber numberWithBool:SKAPushInTabbarState], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)SKAPushInTabbarState{
    return [objc_getAssociatedObject(self, SKAPushInTabbarStateKey) intValue];
}

#pragma mark - Function
- (void)SKA_push:(NSString *)viewController param:(NSDictionary *)param{
    [self SKA_push:viewController param:param hideNavi:self.navigationController.navigationBar.hidden hideTabbar:self.tabBarController.tabBar.hidden];
}
- (void)SKA_push:(NSString *)viewController param:(NSDictionary *)param hideNavi:(BOOL)hideNavi{
    [self SKA_push:viewController param:param hideNavi:hideNavi hideTabbar:self.tabBarController.tabBar.hidden];
}
- (void)SKA_push:(NSString *)viewController param:(NSDictionary *)param hideTabbar:(BOOL)hideTabbar{
    [self SKA_push:viewController param:param hideNavi:self.navigationController.navigationBar.hidden hideTabbar:hideTabbar];
}
- (void)SKA_push:(NSString *)viewController param:(NSDictionary *)param hideNavi:(BOOL)hideNavi hideTabbar:(BOOL)hideTabbar{
    
    UIViewController * vc = [NSClassFromString(viewController) new];
    if (param != nil){
        [vc setValuesForKeysWithDictionary:param];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:vc animated:YES];
        
        vc.SKAPushInNaviState = self.navigationController.navigationBar.hidden;
        vc.SKAPushInTabbarState = self.tabBarController.tabBar.hidden;
        vc.navigationController.navigationBar.hidden = hideNavi;
        vc.tabBarController.tabBar.hidden = hideTabbar;
    });
}
- (void)SKA_pop:(NSString *)viewController param:(NSDictionary *)param{
    UIViewController * vc = [NSClassFromString(viewController) new];
    if (param != nil){
        [vc setValuesForKeysWithDictionary:param];
    }
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)SKA_back{
    if (self.navigationController){
        [self.navigationController popViewControllerAnimated:YES];
        self.navigationController.navigationBar.hidden = self.SKAPushInNaviState;
        self.tabBarController.tabBar.hidden = self.SKAPushInTabbarState;
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
