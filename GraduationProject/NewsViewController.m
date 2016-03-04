//
//  NewsViewController.m
//  GraduationProject
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NewsViewController.h"
#import "DataManager.h"
#import "DDataModels.h"
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    DDetailedNewsModel *model;
    UITableView *_tableView;
}
@end

@implementation NewsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = NO;
    
}
- (void)viewDidLoad
{
   
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
   
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [DataManager getDetailedNewsWithAid:_listModel.aid completion:^(NSDictionary *dic) {
        
        model = [DDetailedNewsModel modelObjectWithDictionary:dic];
        
        [_tableView reloadData];
    }];
    
}

- (void)btnClick
{

   //[DataManager getDatasWithUrl:model.articleInfo.shareUrl completion:^(NSDictionary *dic) {
       
    NSLog(@"%@",model.articleInfo.content);
    
   //}];
}



#pragma mark-----UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
  
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
   
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
