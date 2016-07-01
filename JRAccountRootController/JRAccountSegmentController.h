//
//  JRAccountSegmentController.h
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/30.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRAccountSubBaseController.h"
#import "JRAccountSegmentControllerDelegate.h"
@interface JRAccountSegmentController : JRAccountSubBaseController
@property (nonatomic,assign) CGFloat segmentViewHeight;

@property (nonatomic, copy) NSMutableArray * segmentTitleArr;
@property (nonatomic, assign) NSInteger count;

@property (nonatomic,weak)UIViewController<JRAccountSegmentControllerDelegate> *currentController;

- (instancetype)initWithControllers:(UIViewController<JRAccountSegmentControllerDelegate> *) viewController,...NS_REQUIRES_NIL_TERMINATION;

- (void)setControllerArray:(NSArray *)controllerArray;
- (void)configTitleArr;

@end
