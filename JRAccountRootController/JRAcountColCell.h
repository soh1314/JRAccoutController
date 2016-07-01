//
//  JRAcountColCell.h
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/29.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRAccountConstant.h"
@interface JRAcountColCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImag;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;

@end
