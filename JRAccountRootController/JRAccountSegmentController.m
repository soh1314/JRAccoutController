//
//  JRAccountSegmentController.m
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/30.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import "JRAccountSegmentController.h"

static const CGFloat KSegmentBarHeight = 60;
/// some views
#import "JRSegmentBar.h"

/// utils
#import "UIViewController+Moving.h"

// framework
#import <Masonry/Masonry.h>

@interface JRAccountSegmentController ()<JRSegmentBarActionDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) JRSegmentBar * segmentBar;
@property (nonatomic, strong) NSMutableArray * viewControllers;
@property(nonatomic, assign) CGFloat originaSubPagerViewlTopInset;
@property(nonatomic, strong) NSHashTable *hasShownControllers;
@end
@implementation JRAccountSegmentController
- (instancetype)initWithControllers:(UIViewController<JRAccountSegmentControllerDelegate> *) viewController,...NS_REQUIRES_NIL_TERMINATION
{
    self = [super init];
    if (self) {
        NSAssert(viewController != nil, @"the first controller must not be nil!");
        [self initViewParameters];
        UIViewController<JRAccountSegmentControllerDelegate> *eachController;
        va_list argumentList;
        if (viewController) {
            [self.viewControllers addObject:viewController];
            va_start(argumentList, viewController);
            while ((eachController = va_arg(argumentList, id))) {
                [self.viewControllers addObject:eachController];
            }
            va_end(argumentList);
        }
    }
    return self;
}
- (id)init
{
    if (self = [super init]) {
        [self initViewParameters];
    }
    return self;
}
- (void)initViewParameters
{
    self.hasShownControllers = [NSHashTable weakObjectsHashTable];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self baseConfig];
}

- (void)baseConfig
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self configSegmentView];
    [self insertDefaultController:^(UIViewController<JRAccountSegmentControllerDelegate> *controller) {
        [self configControllerView:controller];
    }];
    self.currentController = self.viewControllers[0];
}
- (void)configSegmentView
{
    [self.view addSubview:self.segmentBar];
    [self.viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController<JRAccountSegmentControllerDelegate> * viewController = obj;
        [self.segmentBar.segment insertSegmentWithTitle:[viewController segmentTitle] atIndex:idx animated:NO];
    }];
    self.segmentBar.segment.selectedSegmentIndex = 0;
}
- (void)insertDefaultController:(void(^)(UIViewController<JRAccountSegmentControllerDelegate> *))configController
{
    if (self.viewControllers.count > 1) {
        UIViewController<JRAccountSegmentControllerDelegate> * viewController = self.viewControllers[0];
        [self insertViewController:viewController];
        configController(viewController);
    }
 
}

- (void)configControllerView:(UIViewController<JRAccountSegmentControllerDelegate> *)viewController
{
    [self layoutViewController:viewController];
}

- (void)layoutViewController:(UIViewController<JRAccountSegmentControllerDelegate> *)viewController
{
    UIView * subView = viewController.view;
    if ([subView
         respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        subView.preservesSuperviewLayoutMargins = YES;
    }
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    UIScrollView * scrollView = [self scrollViewInPageController:viewController];
    if (scrollView) {
        scrollView.alwaysBounceVertical = YES;
         self.originaSubPagerViewlTopInset =  KSegmentBarHeight;
        CGFloat bottomInset = 0;
        if (self.tabBarController.tabBar.hidden == NO) {
            bottomInset = CGRectGetHeight(self.tabBarController.tabBar.bounds);
        }
        [scrollView
         setContentInset:UIEdgeInsetsMake(self.originaSubPagerViewlTopInset+64, 0, bottomInset, 0)];
        if (![self.hasShownControllers containsObject:viewController]) {
            [self.hasShownControllers addObject:viewController];
            [scrollView setContentOffset:CGPointMake(0,  -1*KSegmentBarHeight-64)];
        }
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view);
            make.right.mas_equalTo(self.view);
            make.top.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view);
        }];
    }
    else
    {
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view);
            make.right.mas_equalTo(self.view);
            make.top.mas_equalTo(self.segmentBar.mas_bottom);
            make.height.mas_equalTo(self.view).offset(-KSegmentBarHeight);
        }];
    }
    
}
- (UIScrollView *)scrollViewInPageController:(UIViewController<JRAccountSegmentControllerDelegate> *) controller
{
    if ([controller respondsToSelector:@selector(streachScrollView)]) {
        return [controller streachScrollView];
    } else if ([controller.view isKindOfClass:[UIScrollView class]]) {
        return (UIScrollView *)controller.view;
    } else {
        return nil;
    }
}
#pragma mark --- segmentBar delegate
- (void)segmentBar:(JRSegmentBar *)bar didTouchSegment:(NSInteger)row
{
    UIViewController<JRAccountSegmentControllerDelegate> *controller =
    self.viewControllers[row];
    
    [self.currentController willMoveToParentViewController:nil];
    [self.currentController.view removeFromSuperview];
    [self.currentController removeFromParentViewController];
    [self.currentController didMoveToParentViewController:nil];
    
    [controller willMoveToParentViewController:self];
    [self.view insertSubview:controller.view atIndex:0];
    [self addChildViewController:controller];
    [controller didMoveToParentViewController:self];
    
    // reset current controller
    self.currentController = controller;
    // layout new controller
    [self layoutViewController:controller];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}
//设置控制器数组
- (void)setControllerArray:(NSArray *)controllerArray
{
    [self.viewControllers removeAllObjects];
    [self.viewControllers addObjectsFromArray:controllerArray];
}
#pragma mark ---lazy
- (JRSegmentBar *)segmentBar
{
    if (!_segmentBar) {
        _segmentBar = [[JRSegmentBar alloc]initWithFrame:CGRectMake(0, 64, KScreenW, KSegmentBarHeight) segmentTitleArr:self.segmentTitleArr];
        _segmentBar.tintColor = [UIColor orangeColor];
        _segmentBar.delegate = self;
        }
    return _segmentBar;
}
- (NSMutableArray *)viewControllers
{
    if (!_viewControllers) {
        _viewControllers = [NSMutableArray array];
    }
    return _viewControllers;
}
@end
