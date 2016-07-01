//
//  JRAcountColCell.m
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/29.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import "JRAcountColCell.h"

@implementation JRAcountColCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageH.constant *= KScreenW/375;
    self.imageW.constant *= KScreenW/375;
//    self.top.constant *=KScreenW/375;
    // Initialization code
}

@end
