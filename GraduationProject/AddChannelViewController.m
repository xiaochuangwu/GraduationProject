//
//  AddChannelViewController.m
//  GraduationProject
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AddChannelViewController.h"

@interface AddChannelViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    
    NSMutableArray *imagineTerm;


}

@end

@implementation AddChannelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
     self.navigationController.navigationBar.hidden = YES;
    //布局假的导航条
    [self layouNavBar];
    
    imagineTerm = [[NSMutableArray alloc]init];
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    //行的最小间距
    flowlayout.minimumLineSpacing = 10;
    //每隔单元格的最小间距
    flowlayout.minimumInteritemSpacing = 10;
    //滑动的方向
    flowlayout.scrollDirection =  UICollectionViewScrollDirectionVertical;
    //控件的上左下右间距
    flowlayout.sectionInset = UIEdgeInsetsMake(60, 10, 0, 10);
    //单元格的大小
    flowlayout.itemSize = CGSizeMake((CGRectGetWidth(self.view.frame)-40)/3.0, 40);
     
    //一个layout对象,不能同时给两个collection来使用
    //创建
    //根tableview的区别,后面多了个layout
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 90, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) collectionViewLayout:flowlayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    //默认是黑色的
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
    
    //注册cell
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}
//布局假的导航条
- (void)layouNavBar
{
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.frame), 44)];
    navView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:navView];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(5, 10, 30, 24);
    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [navView addSubview:btn];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-80)/2, 10, 80, 24)];
    titleLab.text = @"频道管理";
    [navView addSubview:titleLab];
    
    UIButton *creatBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [creatBtn setTitle:@"创建兴趣夹" forState:UIControlStateNormal];
    creatBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    creatBtn.frame = CGRectMake(CGRectGetWidth(self.view.frame)-90, 14, 80, 16);
    [creatBtn addTarget:self action:@selector(createInterestFile:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:creatBtn];

    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, 70, 20)];
    myLabel.font = [UIFont systemFontOfSize:14];
    myLabel.text = @"我的频道";
    [self.view addSubview:myLabel];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    addBtn.tag = 1;
    [addBtn setTitle:@"添加频道" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addAndChange:) forControlEvents:UIControlEventTouchUpInside];
    addBtn.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2, 70, 70, 20);
    addBtn.layer.cornerRadius = 10;
    addBtn.layer.masksToBounds = YES;
    [self.view addSubview:addBtn];
    
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    changeBtn.tag = 2;
    [changeBtn setTitle:@"排序/删除" forState:UIControlStateNormal];
    [changeBtn addTarget:self action:@selector(addAndChange:) forControlEvents:UIControlEventTouchUpInside];
    changeBtn.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2+70, 70, 70, 20);
    changeBtn.layer.cornerRadius = 10;
    changeBtn.layer.masksToBounds = YES;
    [self.view addSubview:changeBtn];
}

//创建兴趣夹
- (void)createInterestFile:(UIButton*)buttonClick
{




}

//添加频道,频道排序删除
- (void)addAndChange:(UIButton*)sender
{



}
//返回
- (void)back:(UIButton*)button
{


    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark----UICollectionViewDataSource
//行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0)
    {
        return _myTerm.count;
    }
    else
    {
    
        return 10;
    }
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithHue:(arc4random()%255/255.0) saturation:(arc4random()%255/255.0) brightness:(arc4random()%255/255.0) alpha:1];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1)
    {
        [_myTerm addObject:[NSString stringWithFormat:@"%ld",indexPath.row]];
        [collectionView reloadData];
    }

    NSLog(@"%ld",(long)indexPath.row);
    
    
}

- (void)didReceiveMemoryWarning
{
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
