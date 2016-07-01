//
//  ViewController.m
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/29.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import "JRAccountRootController.h"
#import "JRAccountConstant.h"
#import "JRNineItemCell.h"
#import "JRSegmentCell.h"
#import "JRAcountHeaderView.h"

#import "JRAccountControllerNavier.h"

///viewController
#import "JRAccountSegmentController.h"
#import "TableViewController.h"
#import "CollectionViewController.h"
@interface JRAccountRootController ()<UITableViewDelegate,UITableViewDataSource,JRNineItemSelectDelegate>
@property (nonatomic , strong) UITableView * tableView;
@property (nonatomic , strong) JRAcountHeaderView * header;

@end

@implementation JRAccountRootController
- (id)init
{
    if (self = [super init]) {
        self.title = @"我的账户";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
         self.tableView.tableHeaderView = self.header;
        [_tableView registerNib:[UINib nibWithNibName:@"JRSegmentCell" bundle:nil] forCellReuseIdentifier:@"JRSegmentCellID"];
        [_tableView registerClass:[JRNineItemCell class] forCellReuseIdentifier:@"JRNineItemCellID"];
    }
    return _tableView;
}
- (JRAcountHeaderView *)header
{
    if (!_header) {
        _header = [JRAcountHeaderView headerView];
    }
    return _header  ;
}
#pragma mark --tableview delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        JRSegmentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JRSegmentCellID" forIndexPath:indexPath];
        
        return cell;
    }
    else
    {
        JRNineItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JRNineItemCellID" forIndexPath:indexPath];
        cell.imageArray = ACCOUNTCOLIMAGEARR;
        cell.delegate = self;
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
       
        return 65;
    }
    else
    {
        return KCOLHeight;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma  mark --- nineItemCell delegate
- (void)itemCell:(JRNineItemCell *)cell didSelectItem:(NSIndexPath *)indexPath
{
    TableViewController *table = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
    CollectionViewController *collectionView = [[CollectionViewController alloc] initWithNibName:@"CollectionViewController" bundle:nil];
    
    TableViewController *table1 = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
    
    JRAccountSegmentController *pager = [[JRAccountSegmentController alloc] init];
    [pager setControllerArray:@[table1,collectionView]];
    [self.navigationController pushViewController:pager animated:YES];
//    [JRAccountControllerNavier navController:self toNext:AccountContollerArr[indexPath.row]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
