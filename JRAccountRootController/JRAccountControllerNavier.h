//
//  JRAccountControllerNavier.h
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/30.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JRAccountConstant.h"
@interface JRAccountControllerNavier : NSObject
+ (void)navController:(UIViewController *)currentController toNext:(NSString *)nextController;

@end
