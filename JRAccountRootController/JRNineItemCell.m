//
//  JRNineItemCell.m
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/29.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import "JRNineItemCell.h"
#import "JRAcountColCell.h"
#import "JRAccountConstant.h"
#define KSCREENW [UIScreen mainScreen].bounds.size.width
#define KSCREENH [UIScreen mainScreen].bounds.size.height
#define COLLECTIONIDSTR @"JRAcountColCelID"
@interface JRNineItemCell () <ZWwaterFlowDelegate>
{
    ZWCollectionViewFlowLayout *_flowLayout;//自定义layout
    int a;
}
@end
@implementation JRNineItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI
{
    self.backgroundColor = [UIColor lightGrayColor];
    _flowLayout = [[ZWCollectionViewFlowLayout alloc]init];
    _flowLayout.colMagrin = 1;
    _flowLayout.rowMagrin = 1;
    _flowLayout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
    _flowLayout.colCount = 3;
    _flowLayout.degelate = self;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KSCREENW, KCOLHeight) collectionViewLayout:_flowLayout];
    [_collectionView registerNib:[UINib nibWithNibName:@"JRAcountColCell" bundle:nil] forCellWithReuseIdentifier:COLLECTIONIDSTR];
    [self addSubview:_collectionView];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor lightGrayColor];
    _collectionView.bounces = NO;    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JRAcountColCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:COLLECTIONIDSTR forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.iconImag.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    cell.title.text = ACCOUNTCOLTITLEARR[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
    if (self.delegate && [self.delegate respondsToSelector:@selector(itemCell:didSelectItem:)]&&indexPath.row < 8) {
        [self.delegate itemCell:self didSelectItem:indexPath];

    }
    
}
- (void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
    [self.collectionView reloadData];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (CGFloat)ZWwaterFlow:(ZWCollectionViewFlowLayout *)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPach
{
    return (KCOLHeight-4)/3.0;
}
@end
