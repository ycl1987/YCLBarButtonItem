//
//  UIBarItem+FixedPosition.m
//  JRHaoJie
//
//  Created by 岳重亮 on 2018/9/30.
//  Copyright © 2018年 JR58ganji. All rights reserved.
//

#import "UIBarItem+FixedPosition.h"
#import <objc/message.h>

static const char *fixedStateKey = "fixedStateKey";

@implementation UIBarItem (FixedPosition)

- (void)setFixedState:(NSString *)fixedState{
    
    if (fixedState) {
        objc_setAssociatedObject(self, fixedStateKey, fixedState, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (NSString *)fixedState{
    
    return objc_getAssociatedObject(self, fixedStateKey);
}


@end
