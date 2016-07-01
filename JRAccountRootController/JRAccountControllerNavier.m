//
//  JRAccountControllerNavier.m
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/30.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import "JRAccountControllerNavier.h"

@implementation JRAccountControllerNavier
+ (void)navController:(UIViewController *)currentController toNext:(NSString *)nextController
{
    Class cls = NSClassFromString(nextController);
    UIViewController * ct = [[cls alloc]init];
    ct.view.backgroundColor = [UIColor whiteColor];
    [currentController.navigationController pushViewController:ct animated:YES];
}
@end
