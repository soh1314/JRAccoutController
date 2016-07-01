//
//  JRAccountSubBaseController.m
//  JRAccountRootController
//
//  Created by jingshuihuang on 16/6/30.
//  Copyright © 2016年 JiuRong. All rights reserved.
//

#import "JRAccountSubBaseController.h"
#import "JRAccountConstant.h"
@interface JRAccountSubBaseController ()

@end

@implementation JRAccountSubBaseController
- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavgationItem];
    // Do any additional setup after loading the view.
}
- (void)setNavgationItem
{
    UIBarButtonItem * leftBtnItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"return_button"] style:UIBarButtonItemStyleDone target:self action:@selector(returnLastController:)];
    self.navigationItem.leftBarButtonItem = leftBtnItem ;
    self.title = self.titleStr;
}

- (NSString *)titleStr
{
    return nil;
}
- (void)returnLastController:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
