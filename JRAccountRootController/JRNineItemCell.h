//
//  JRNineItemCell.h
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/29.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWCollectionViewFlowLayout.h"
@class JRNineItemCell;
@protocol JRNineItemSelectDelegate <NSObject>

- (void)itemCell:(JRNineItemCell *)cell didSelectItem:(NSIndexPath *)indexPath;

@end
@interface JRNineItemCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) UICollectionView * collectionView;
@property (nonatomic , weak) id <JRNineItemSelectDelegate> delegate;
@property (nonatomic,copy)NSArray * imageArray;
@end
