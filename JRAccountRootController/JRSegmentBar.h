//
//  JRSegmentBar.h
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/30.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JRSegmentBar;
@protocol JRSegmentBarActionDelegate <NSObject>

- (void)segmentBar:(JRSegmentBar *)bar didTouchSegment:(NSInteger)row;

@end
@interface JRSegmentBar : UIView
@property (nonatomic,strong)UISegmentedControl * segment;
@property (nonatomic,copy)NSArray * segmentTitleArr;
@property (nonatomic,strong)UIColor * tintColor;
@property (nonatomic,weak)id <JRSegmentBarActionDelegate>delegate;
- (id)initWithFrame:(CGRect)frame segmentTitleArr:(NSArray *)titleArr;
@end
