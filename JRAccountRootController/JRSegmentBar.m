//
//  JRSegmentBar.m
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/30.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import "JRSegmentBar.h"

@implementation JRSegmentBar
- (id)initWithFrame:(CGRect)frame segmentTitleArr:(NSArray *)titleArr;
{
    if (self = [super initWithFrame:frame]) {
        self.segmentTitleArr = titleArr;
        [self initUI];
        
    }
    return self;
}
- (void)initUI
{
    [self addSubview:self.segment];
    self.backgroundColor = [UIColor whiteColor];
}
- (void)layoutSubviews
{
    _segment.frame = CGRectMake(15, 15, self.bounds.size.width-30, 35);
    _segment.tintColor = self.tintColor?self.tintColor:[UIColor redColor];
}
- (void)setSegmentTitleArr:(NSArray *)segmentTitleArr
{
    _segmentTitleArr = segmentTitleArr;
    
}
#pragma mark --lazy
- (UISegmentedControl *)segment
{
    if (!_segment) {
        _segment = [[UISegmentedControl alloc]initWithItems:self.segmentTitleArr];
        
        _segment.selectedSegmentIndex = 0;
        [_segment setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:15]} forState:UIControlStateNormal];
        [_segment addTarget:self action:@selector(segmentTouch:) forControlEvents:UIControlEventValueChanged];
    }
    return _segment;
}
- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
    [self setNeedsDisplay];
}
- (void)segmentTouch:(id)sender
{
    UISegmentedControl * segment = sender;
    NSInteger curruntIndex = segment.selectedSegmentIndex;
    if (self.delegate && [self.delegate respondsToSelector:@selector(segmentBar:didTouchSegment:)]) {
        [self.delegate segmentBar:self didTouchSegment:curruntIndex];
    }
}
@end
