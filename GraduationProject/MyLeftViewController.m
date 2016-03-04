//
//  MyLeftViewController.m
//  GraduationProject
//
//  Created by mac on 16/3/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MyLeftViewController.h"
#import "Masonry.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"

#define HEADIMG_HEIGHT ([UIScreen mainScreen].bounds.size.height*1.0/4.0)/2.0
#define TOP_HEIGHT (CGRectGetHeight(view.frame)-HEADIMG_HEIGHT)/2.0
#define TOP_NAMELAB (HEADIMG_HEIGHT-20)/2.0
@interface MyLeftViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;


}
@end

@implementation MyLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame)*0.80, CGRectGetHeight(self.view.frame))];
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //不让tableview滑动
    _tableView.scrollEnabled =NO;
    [self.view addSubview:_tableView];
}

#pragma mark ---UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSArray *arr = [[NSArray alloc]initWithObjects:@"我的收藏",@"提交公众号",@"关于我们",@"版本更新", nil];
    cell.textLabel.text = arr[indexPath.row];
    return cell;

}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor grayColor];
    //view.alpha = 0.2;
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.layer.cornerRadius = HEADIMG_HEIGHT/2.0;
    imgView.layer.masksToBounds = YES;
    imgView.image = [UIImage imageNamed:@"1.jpg"];
    [view addSubview:imgView];
    imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(view.mas_left).with.offset(10.0f);
        make.top.equalTo(view.mas_top).with.offset(-TOP_HEIGHT);
        
        make.height.equalTo(@(HEADIMG_HEIGHT));
        make.width.equalTo(@(HEADIMG_HEIGHT));
        
    }];
    
    UILabel *nameLab = [[UILabel alloc]init];
    nameLab.text = @"不做大哥好多年";
    [view addSubview:nameLab];
    nameLab.layer.masksToBounds = YES;
    
    [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(imgView.mas_right).with.offset(10.0f);
        make.top.equalTo(imgView.mas_top).with.offset(TOP_NAMELAB);
        
        make.height.equalTo(@20);
        
    }];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{


    return HEADIMG_HEIGHT*2;
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
