//
//  JRAcountHeaderView.h
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/29.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRAcountHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *accountRemainMoney;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UIButton *withdraw;
@property (weak, nonatomic) IBOutlet UIButton *topup;
- (IBAction)withDraw:(id)sender;
- (IBAction)topup:(id)sender;

+ (instancetype)headerView;
@end
