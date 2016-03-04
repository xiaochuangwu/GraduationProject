//
//  FirstViewController.m
//  GraduationProject
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FirstViewController.h"
#import "NewsViewController.h"
#import "AddChannelViewController.h"
#import "SearchViewController.h"
#import "DataManager.h"
#import "MDataModels.h"
#import "NSData+JSON.h"
#import "NewsListTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "NNDataModels.h"

#define BUTTONSCROLLHEIGHT 32
#define BTNWIDTH 60




@interface FirstViewController ()
{
    //NSMutableArray *titleArray;
    NSMutableArray *tableViewArray;
    NSMutableArray *buttonArray;
    UIScrollView *btnScrollView;//标题scroll
    UIScrollView *tableScrollView;//新闻界面scroll
    MMenuModel *model;
    NSInteger *selectedTableView;
    NNNewsModel *newsModel;
    
}
@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //titleArray = [[NSMutableArray alloc]init];
    buttonArray = [[NSMutableArray alloc]init];
    tableViewArray = [[NSMutableArray alloc]init];

    
    
    self.title = @"号外";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchNews:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(menu)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [DataManager getNewsMenu:^(NSDictionary *dic) {
        
        model = [[MMenuModel alloc]initWithDictionary:dic];
        
        [self layoutNav];
        [self newsScrollView];
        
    }];
    
    

    
    
    
}

- (void)menu
{
  

}

- (void)searchNews:(UIBarButtonItem*)barButton
{
    SearchViewController *searchVc = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:searchVc animated:YES];


}
#pragma mark----UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return newsModel.contentList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NewsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
     //   for (UIButton *btn in buttonArray)
   // {
        //if (btn.selected==YES)
        //{
            
            NNContentList *list = newsModel.contentList[indexPath.row];
            [cell.headImg sd_setImageWithURL:[NSURL URLWithString:list.imgurl]];
            cell.titleName.text = list.title;
            cell.addressLab.text = list.nickname;
    
            NSString *str = [NSString stringWithFormat:@"阅读%@",list.readNum];
            cell.readCount.text = str;
       // }
   // }
    //cell.textLabel.text = titleArray[indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsViewController *newsVc = [[NewsViewController alloc]init];
    //newsVc.newsArray = newsModel.contentList;
    NNContentList *list = newsModel.contentList[indexPath.row];
    newsVc.listModel = list;
    [self.navigationController pushViewController:newsVc animated:YES];
   
   


}

//布局新闻界面scroll
- (void)newsScrollView
{
    
    tableScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+BUTTONSCROLLHEIGHT, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-64-BUTTONSCROLLHEIGHT)];
    tableScrollView.delegate = self;
    //scrollView.backgroundColor = [UIColor redColor];
    for (int i = 0; i < model.categoryList.count; i ++)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(i*CGRectGetWidth(self.view.frame), 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(tableScrollView.frame))];
        tableView.delegate = self;
        tableView.dataSource = self;
        
        [tableScrollView addSubview:tableView];
        
        [tableViewArray addObject:tableView];
        [tableView registerNib:[UINib nibWithNibName:@"NewsListTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    
    UITableView *tableView = tableViewArray[0];
    
    
    MCategoryList *list = model.categoryList[0];
    
    [DataManager getNewsListWithCateId:list.typeid completion:^(NSDictionary *dic) {
        
        newsModel = [NNNewsModel modelObjectWithDictionary:dic];
        
        
        [tableView reloadData];
    }];
    tableScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame)*model.categoryList.count, 0);
    //   隐藏水平的下面滑动指示条
    tableScrollView.showsHorizontalScrollIndicator = NO;
    tableScrollView.pagingEnabled = YES;
    
    [self.view addSubview:tableScrollView];
    
    
}
//布局顶层scroll菜单button
- (void)layoutNav
{
    
    //MCategoryList *list = [[MCategoryList alloc]initWithDictionary:model];
    //  创建滚动视图
    //  如果我们使用了系统的导航条  那么远点是在导航条的左下角
    btnScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 64, CGRectGetWidth(self.view.frame)-40, 32)];
    //btnScrollView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    for (int i = 0;i < model.categoryList.count ; i ++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*BTNWIDTH, 3, 60, 27);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        //   得到标题
        //NSString  *stringName = [titleArray objectAtIndex:i];
        MCategoryList *list = model.categoryList[i];
        
        [button setTitle:list.categoryName forState:UIControlStateNormal];
        //   设置标题颜色
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 设置选中标题字体颜色
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        
        
        button.tag = i ;
       
        if (i==0)
        {
            button.selected = YES;
        }
        // 绑方法
        [button addTarget:self action:@selector(buttonClick:) forControlEvents: UIControlEventTouchUpInside];
        
        [btnScrollView addSubview:button];
        
        [buttonArray addObject:button];
        
    }
    //  承载量
    
    btnScrollView.contentSize = CGSizeMake(80*model.categoryList.count, 32);
    //   隐藏水平的下面滑动指示条
    btnScrollView.showsHorizontalScrollIndicator = NO;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(CGRectGetWidth(self.view.frame)-35, 67, 30, 27);
    
    [btn setTitle:@"+" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addChannelViewController:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    [self.view addSubview:btnScrollView];




}

// 点击+号添加频道

- (void)addChannelViewController:(UIButton*)button
{

    AddChannelViewController *addVc = [[AddChannelViewController alloc]init];
    [addVc.myTerm setArray:model.categoryList];
    [self.navigationController pushViewController:addVc animated:YES];


}
//点击按钮移动新闻界面scroll移动
- (void)buttonClick:(UIButton*)button
{
    for (UIButton *btn in buttonArray)
    {
        if (btn.tag == button.tag)
        {
            btn.selected = YES;
            
            [tableScrollView setContentOffset:CGPointMake(btn.tag*CGRectGetWidth(self.view.frame), 0) animated:YES];
            
            UITableView *tableView = tableViewArray[btn.tag];
           
            MCategoryList *list = model.categoryList[btn.tag];
            
            [DataManager getNewsListWithCateId:list.typeid completion:^(NSDictionary *dic) {
                
                newsModel = [NNNewsModel modelObjectWithDictionary:dic];
                
                
                [tableView reloadData];
            }];
            
            
        }
        else
        {
        
            btn.selected = NO;
        }
        
    }
    
    
    
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    
    //    获取结束减速后的偏移量
    CGPoint point = tableScrollView.contentOffset;
    
    //    当获得x坐标以后对320 进行取整来控制pagecontrol的点
    int currentNum = point.x/self.view.frame.size.width;
    
    for (UIButton *btn in buttonArray)
    {
        if (btn.tag == currentNum)
        {
            
            
            btn.selected = YES;
            UITableView *tableView = tableViewArray[btn.tag];
            
            MCategoryList *list = model.categoryList[btn.tag];
            
            [DataManager getNewsListWithCateId:list.typeid completion:^(NSDictionary *dic) {
                
                newsModel = [NNNewsModel modelObjectWithDictionary:dic];
                
                
                [tableView reloadData];
            }];

           

        }
        else
        {
            btn.selected = NO;
        
        }
    }
    if (currentNum !=0 && currentNum !=1) {
        

        
        [btnScrollView setContentOffset:CGPointMake((currentNum-2)*BTNWIDTH, 0) animated:YES];
        
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
