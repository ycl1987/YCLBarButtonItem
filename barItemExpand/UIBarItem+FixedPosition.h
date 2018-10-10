//
//  UIBarItem+FixedPosition.h
//  JRHaoJie
//
//  Created by 岳重亮 on 2018/9/30.
//  Copyright © 2018年 JR58ganji. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarItem (FixedPosition)

/** 导航栏判断是否已经设置左边距 */
@property (nonatomic, copy) NSString *fixedState;

@end

NS_ASSUME_NONNULL_END
