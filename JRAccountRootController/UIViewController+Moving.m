//
//  UIViewController+Moving.m
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/7/1.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import "UIViewController+Moving.h"

@implementation UIViewController (Moving)
- (void)insertViewController:(UIViewController *)controller
{
    [controller willMoveToParentViewController:self];
    [self.view insertSubview:controller.view atIndex:0];
    [self addChildViewController:controller];
    [controller didMoveToParentViewController:self];
}
@end
