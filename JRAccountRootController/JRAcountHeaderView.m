//
//  JRAcountHeaderView.m
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/29.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import "JRAcountHeaderView.h"

@implementation JRAcountHeaderView
- (IBAction)withDraw:(id)sender {
}

- (IBAction)topup:(id)sender {
    
}
+ (instancetype)headerView
{
    NSArray * arr = [[NSBundle mainBundle]loadNibNamed:@"JRAcountHeaderView" owner:nil options:nil];
    return [arr firstObject];
}
@end
