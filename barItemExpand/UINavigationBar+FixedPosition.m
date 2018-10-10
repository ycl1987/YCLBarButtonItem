//
//  UINavigationBar+FixedPosition.m
//  JRHaoJie
//
//  Created by 岳重亮 on 2018/9/30.
//  Copyright © 2018年 JR58ganji. All rights reserved.
//

#import "UINavigationBar+FixedPosition.h"
#import <objc/message.h>

#define iOS11_Later ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)

@implementation UINavigationBar (FixedPosition)

+ (void)load{
    
    [super load];
    
    Method originalMethod = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method swizzledMethod = class_getInstanceMethod(self, @selector(customlayoutSubviews));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)customlayoutSubviews{
    
    [self customlayoutSubviews];
    
    if (iOS11_Later) {
        
        self.layoutMargins = UIEdgeInsetsZero;
        
        for (UIView *subview in self.subviews) {
            
            if ([NSStringFromClass(subview.class) containsString:@"ContentView"]) {
                subview.layoutMargins = UIEdgeInsetsZero;//可修正iOS11之后的偏移
            }
        }
    }
}




@end
