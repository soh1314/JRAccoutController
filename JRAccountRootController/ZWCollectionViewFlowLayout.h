
#import <UIKit/UIKit.h>
@class ZWCollectionViewFlowLayout;
@protocol ZWwaterFlowDelegate <NSObject>

-(CGFloat)ZWwaterFlow:(ZWCollectionViewFlowLayout*)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath*)indexPach;

@end

@interface ZWCollectionViewFlowLayout : UICollectionViewLayout
@property(nonatomic,assign)UIEdgeInsets sectionInset;
@property(nonatomic,assign)CGFloat rowMagrin;
@property(nonatomic,assign)CGFloat colMagrin;
@property(nonatomic,assign)CGFloat colCount;
@property(nonatomic,weak)id<ZWwaterFlowDelegate>degelate;
@end
