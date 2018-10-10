//
//  UINavigationItem+FixedPosition.m
//  JRHaoJie
//
//  Created by 岳重亮 on 2018/9/30.
//  Copyright © 2018年 JR58ganji. All rights reserved.
//

#import "UINavigationItem+FixedPosition.h"
#import "UIBarItem+FixedPosition.h"
#import <objc/message.h>
#import "UIView+Addition.h"

#define iOS11_Later ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)

@implementation UINavigationItem (FixedPosition)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [super load];
        
        Method originalLeftMethod = class_getInstanceMethod(self, @selector(setLeftBarButtonItem:));
        Method swizzledLeftMethod = class_getInstanceMethod(self, @selector(JR_setLeftBarButtonItem:));
        method_exchangeImplementations(originalLeftMethod, swizzledLeftMethod);
        
        Method originalLeftsMethod = class_getInstanceMethod(self, @selector(setLeftBarButtonItems:));
        Method swizzledLeftsMethod = class_getInstanceMethod(self, @selector(JR_setLeftBarButtonItems:));
        method_exchangeImplementations(originalLeftsMethod, swizzledLeftsMethod);
        
        Method originalRightMethod = class_getInstanceMethod(self, @selector(setRightBarButtonItem:));
        Method swizzledRightMethod = class_getInstanceMethod(self, @selector(JR_setRightBarButtonItem:));
        method_exchangeImplementations(originalRightMethod, swizzledRightMethod);
        
        Method originalRightsMethod = class_getInstanceMethod(self, @selector(setRightBarButtonItems:));
        Method swizzledRightsMethod = class_getInstanceMethod(self, @selector(JR_setRightBarButtonItems:));
        method_exchangeImplementations(originalRightsMethod, swizzledRightsMethod);
    });
}

- (void)JR_setLeftBarButtonItem:(UIBarButtonItem *)item{
    
    //是否是最左边的item并且为按钮设置UIEdgeInsets否则添加占位视图
    
    if (iOS11_Later) {
        
        if ([item.customView isKindOfClass:[UIButton class]]){
            
            UIButton *leftBtn = item.customView;
            if (!item.fixedState) {
                
                UIEdgeInsets earlyEdge = leftBtn.contentEdgeInsets;
                earlyEdge.left += 15;
                leftBtn.width += 15;
                leftBtn.contentEdgeInsets = earlyEdge;
                item.fixedState = @"setted";
            }
            
        }else{
            
            UIBarButtonItem *fixBtn = [self fixedSpaceWithWidth:15];
            [self JR_setLeftBarButtonItems:@[fixBtn,item]];
            return;
        }
    }
    
    [self JR_setLeftBarButtonItem:item];

}

- (void)JR_setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)items{
    
    if (iOS11_Later && items.count > 0){
        
        UIBarButtonItem *firstItem = items.firstObject;
        if ([firstItem.customView isKindOfClass:[UIButton class]]) {
            
            UIButton *leftBtn = firstItem.customView;
            if (!firstItem.fixedState) {
                
                UIEdgeInsets earlyEdge = leftBtn.contentEdgeInsets;
                earlyEdge.left += 15;
                leftBtn.width += 15;
                leftBtn.contentEdgeInsets = earlyEdge;
                firstItem.fixedState = @"setted";
            }
            
        }else{
            
            NSMutableArray *finnalItems = [NSMutableArray arrayWithArray:items];
            if (finnalItems.count > 0) {
                
                UIBarButtonItem *firstItem = [finnalItems firstObject];
                if (!firstItem.fixedState) {
                    
                    UIBarButtonItem *fixBtn = [self fixedSpaceWithWidth:15];
                    [finnalItems insertObject:fixBtn atIndex:0];
                    fixBtn.fixedState = @"setted";
                }
            }
            [self JR_setLeftBarButtonItems:finnalItems];
            return;
        }
    }

    [self JR_setLeftBarButtonItems:items];
}

- (void)JR_setRightBarButtonItem:(UIBarButtonItem *)item{
    
    if (iOS11_Later) {
            
        if ([item.customView isKindOfClass:[UIButton class]]){
            
            UIButton *rightBtn = item.customView;
            if (!item.fixedState) {
                
                UIEdgeInsets earlyEdge = rightBtn.contentEdgeInsets;
                earlyEdge.right += 15;
                rightBtn.width += 15;
                rightBtn.contentEdgeInsets = earlyEdge;
                item.fixedState = @"setted";
            }
            
        }else{
            
            UIBarButtonItem *fixBtn = [self fixedSpaceWithWidth:15];
            [self JR_setRightBarButtonItems:@[fixBtn,item]];
            return;
        }
    }
    
    [self JR_setRightBarButtonItem:item];
}

- (void)JR_setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)items{
    
    if (iOS11_Later && items.count > 0){
        
        UIBarButtonItem *firstItem = items.firstObject;
        if ([firstItem.customView isKindOfClass:[UIButton class]]) {
            
            UIButton *rightBtn = firstItem.customView;
            if (!firstItem.fixedState) {
                
                UIEdgeInsets earlyEdge = rightBtn.contentEdgeInsets;
                earlyEdge.right += 15;
                rightBtn.width += 15;
                rightBtn.contentEdgeInsets = earlyEdge;
                firstItem.fixedState = @"setted";
            }
            
        }else{
            
            NSMutableArray *finnalItems = [NSMutableArray arrayWithArray:items];
            if (finnalItems.count > 0) {
                
                UIBarButtonItem *firstItem = [finnalItems firstObject];
                if (!firstItem.fixedState) {
                    
                    UIBarButtonItem *fixBtn = [self fixedSpaceWithWidth:15];
                    [finnalItems insertObject:fixBtn atIndex:0];
                    fixBtn.fixedState = @"setted";
                }
            }
            [self JR_setRightBarButtonItems:finnalItems];
            return;
        }
    }
    
    [self JR_setRightBarButtonItems:items];
}

- (UIBarButtonItem *)fixedSpaceWithWidth:(CGFloat)width{
    
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:nil
                                                                               action:nil];
    fixedSpace.width = width;
    return fixedSpace;
}

@end
