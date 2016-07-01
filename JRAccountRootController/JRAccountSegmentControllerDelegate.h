//
//  JRAccountSegmentControllerDelegate.h
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/7/1.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol JRAccountSegmentControllerDelegate <NSObject>
- (NSString * )segmentTitle;
@optional
- (UIScrollView *)streachScrollView;
@end
