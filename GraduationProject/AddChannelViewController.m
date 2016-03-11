//
//  AddChannelViewController.m
//  GraduationProject
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AddChannelViewController.h"


#define KBase_tag1     100
#define KBase_tag2     500
#define IphoneWidth   [UIScreen mainScreen].bounds.size.width
#define IphoneHeight  [UIScreen mainScreen].bounds.size.height
@interface AddChannelViewController ()
{
    
    NSInteger num1;
    NSInteger num2;
    // 开始拖动的view的下一个view的CGPoint（如果开始位置是0 结束位置是4 nextPoint值逐个往下算）
    CGPoint nextPoint;
    
    // 用于赋值CGPoint
    CGPoint valuePoint;
    NSMutableArray *btnArr1;
    NSMutableArray *btnArr2;
    
    NSMutableArray *buttonArr1;
    NSMutableArray *buttonArr2;
}

@end

@implementation AddChannelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
     self.navigationController.navigationBar.hidden = YES;
    btnArr1 = [[NSMutableArray alloc]init];
    btnArr2 = [[NSMutableArray alloc]init];
    buttonArr1 = [[NSMutableArray alloc]init];
    buttonArr2 = [[NSMutableArray alloc]init];
    [btnArr1 addObject:@"文史"];
    [btnArr1 addObject:@"地理"];
    [btnArr1 addObject:@"军事"];
    [btnArr1 addObject:@"文化"];
    [btnArr1 addObject:@"财经"];
    [btnArr1 addObject:@"政法"];
    [btnArr1 addObject:@"幽灵"];
    [btnArr1 addObject:@"诡异"];
    [btnArr2 addObject:@"美女"];
    [btnArr2 addObject:@"两性"];
    [btnArr2 addObject:@"电影"];
    [btnArr2 addObject:@"社会"];
    [btnArr2 addObject:@"出轨"];
    [btnArr2 addObject:@"外遇"];
    [btnArr2 addObject:@"美食"];
    [btnArr2 addObject:@"游戏"];
    [btnArr2 addObject:@"政治"];
    [btnArr2 addObject:@"物理"];
    [btnArr2 addObject:@"科技"];
    [btnArr2 addObject:@"航空"];
    [btnArr2 addObject:@"小三"];
    [btnArr2 addObject:@"包养"];
    [btnArr2 addObject:@"健康"];
    NSLog(@"%lu",(unsigned long)btnArr1.count);
    num1 = btnArr1.count;
    num2 = btnArr2.count;
    //布局假的导航条
    [self layouNavBar];
 
    [self setButton];



    
}


- (void)setButton
{
    // 创建9宫格
    CGFloat btW = (IphoneWidth-20*5)/4;
    CGFloat btH = 20;
    
    for (NSInteger i = 0; i < num1; i++)
    {
        
        UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(20+(20+btW)*(i%4), 100 + (i/4)*(btH+20), btW, btH);
        bt.backgroundColor = [UIColor redColor];
        bt.tag = KBase_tag1+i;
        [bt setTitle:btnArr1[i] forState:UIControlStateNormal];
         [bt addTarget:self action:@selector(doAdd:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bt];
        // 长按手势
        UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [bt addGestureRecognizer:longPress];
        [buttonArr1 addObject:bt];
        
    }
    
    UIButton *button = buttonArr1[buttonArr1.count-1];
    
    for (NSInteger i = 0; i<num2; i++)
    {
        
        
        UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(20+(20+btW)*(i%4), button.frame.origin.y +80 + (i/4)*(btH+20), btW, btH);
        bt.backgroundColor = [UIColor redColor];
        bt.tag = KBase_tag2+i;
        [bt setTitle:btnArr2[i] forState:UIControlStateNormal];
         [bt addTarget:self action:@selector(doAdd:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bt];
        
        
        [buttonArr2 addObject:bt];
        
    }



}

- (void)doAdd:(UIButton*)bt;
{

    
    if (bt.tag>=500)
    {
        // 需要移除的view的位置
        CGPoint btPoint = bt.center;
        NSInteger btIndex  = bt.tag - KBase_tag2;
        
        NSString *str = btnArr2[btIndex];
        // 移除view
        //[bt removeFromSuperview];
        
        // 把需要删除view的下一个view移动到记录的view的位置(valuePoint)，并把下一view的位置记为新的nextPoint，并把view的tag值-1,依次处理
        __block CGPoint  wbtPoint = btPoint;
        [UIView animateWithDuration:0.3 animations:^{
            for (NSInteger i = btIndex+1; i<num2; i++) {
                UIButton * nextBt = (UIButton*)[self.view viewWithTag:KBase_tag2+i];
                nextPoint = nextBt.center;
                nextBt.center = wbtPoint;
                wbtPoint = nextPoint;
                
                nextBt.tag --;
                //[nextBt setTitle:[NSString stringWithFormat:@"tag值%ld",nextBt.tag] forState:UIControlStateNormal];
                
            }
            
        } completion:^(BOOL finished) {
            num2--;
            [btnArr2 removeObjectAtIndex:btIndex];
            [buttonArr2 removeObject:bt];
            [buttonArr1 addObject:bt];
        }];
        [self addBtn1With:str button:bt];
        

    }
    else
    {
        // 需要移除的view的位置
        CGPoint btPoint = bt.center;
        NSInteger btIndex  = bt.tag - KBase_tag1;
        
        NSString *str = btnArr1[btIndex];
        // 移除view
        //[bt removeFromSuperview];
        
        // 把需要删除view的下一个view移动到记录的view的位置(valuePoint)，并把下一view的位置记为新的nextPoint，并把view的tag值-1,依次处理
        __block CGPoint  wbtPoint = btPoint;
        [UIView animateWithDuration:0.3 animations:^{
            for (NSInteger i = btIndex+1; i<num1; i++) {
                UIButton * nextBt = (UIButton*)[self.view viewWithTag:KBase_tag1+i];
                nextPoint = nextBt.center;
                nextBt.center = wbtPoint;
                wbtPoint = nextPoint;
                
                nextBt.tag --;
                //[nextBt setTitle:[NSString stringWithFormat:@"tag值%ld",nextBt.tag] forState:UIControlStateNormal];
                
            }
            
        } completion:^(BOOL finished) {
            num2--;
            [btnArr1 removeObjectAtIndex:btIndex];
            [buttonArr1 removeObject:bt];
            [buttonArr2 insertObject:bt atIndex:0];
            [btnArr2 insertObject:str atIndex:0];
        }];
        [self addBtn1With:str button:bt];
        

    
    
    
    
    }
}

- (void)addBtn1With:(NSString*)str button:(UIButton*)btn
{
    if (btn.tag>=500)
    {
        CGFloat btW = (IphoneWidth-20*5)/4;
        CGFloat btH = 20;
        
        num1++;
        NSInteger btIndex = num1-1;
        
        UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(20+(20+btW)*(btIndex%4), 100 + (btIndex/4)*(btH+20), btW, btH);
        bt.backgroundColor = [UIColor redColor];
        bt.tag = KBase_tag1+btIndex;
        [bt setTitle:str forState:UIControlStateNormal];
        //[bt addTarget:self action:@selector(doDelete:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bt];
        
        // 长按手势
        UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [bt addGestureRecognizer:longPress];
        
        for (UIButton *btn in buttonArr2)
        {
            NSInteger i = btn.tag - KBase_tag2;
            btn.frame =  CGRectMake(20+(20+btW)*(i%4), bt.frame.origin.y +80 + (i/4)*(btH+20), btW, btH);
            
            
            
        }

    }
    else
    {
        CGFloat btW = (IphoneWidth-20*5)/4;
        CGFloat btH = 20;
        
        num1++;
        NSInteger btIndex = num1-1;
        
        UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(20+(20+btW)*(btIndex%4), bt.frame.origin.y +80 + (btIndex/4)*(btH+20), btW, btH);
        bt.backgroundColor = [UIColor redColor];
        bt.tag = KBase_tag2+btIndex;
        [bt setTitle:str forState:UIControlStateNormal];
        //[bt addTarget:self action:@selector(doDelete:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bt];
        
        // 长按手势
        UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [bt addGestureRecognizer:longPress];
        
        for (UIButton *btn in buttonArr1)
        {
            NSInteger i = btn.tag - KBase_tag1;
            btn.frame =  CGRectMake(20+(20+btW)*(i%4), bt.frame.origin.y +80 + (i/4)*(btH+20), btW, btH);
            
            
            
        }

    
    }
    



}
/**
 *  长按手势
 */
-(void)longPress:(UIGestureRecognizer*)recognizer{
    //
    UIButton *recognizerView = (UIButton *)recognizer.view;
    
    // 禁用其他按钮的拖拽手势
    for (UIButton * bt in self.view.subviews) {
        if (bt!=recognizerView) {
            bt.userInteractionEnabled = NO;
        }
    }
    
    // 长按视图在父视图中的位置（触摸点的位置）
    CGPoint recognizerPoint = [recognizer locationInView:self.view];
    NSLog(@"_____%@",NSStringFromCGPoint(recognizerPoint));
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        // 开始的时候改变拖动view的外观（放大，改变颜色等）
        [UIView animateWithDuration:0.2 animations:^{
            recognizerView.transform = CGAffineTransformMakeScale(1.3, 1.3);
            recognizerView.alpha = 0.7;
        }];
        
        // 把拖动view放到最上层
        [self.view bringSubviewToFront:recognizerView];
        
        // valuePoint保存最新的移动位置
        valuePoint = recognizerView.center;
        
    }else if(recognizer.state == UIGestureRecognizerStateChanged){
        
        // 更新pan.view的center
        recognizerView.center = recognizerPoint;
        
        /**
         * 可以创建一个继承UIButton的类(MyButton)，这样便于扩展，增加一些属性来绑定数据
         * 如果在self.view上加其他控件拖拽会奔溃，可以在下面方法里面加判断MyButton，也可以把所有按钮放到一个全局变量的UIView上来替换self.view
         
         */
        for (UIButton * bt in self.view.subviews) {
            
            // 判断是否移动到另一个view区域
            // CGRectContainsPoint(rect,point) 判断某个点是否被某个frame包含
            if (CGRectContainsPoint(bt.frame, recognizerView.center)&&bt!=recognizerView)
            {
                NSLog(@"bt_______%@",bt);
                // 开始位置
                NSInteger fromIndex = recognizerView.tag - KBase_tag1;
                
                // 需要移动到的位置
                NSInteger toIndex = bt.tag - KBase_tag1;
                NSLog(@"开始位置=%ld  结束位置=%ld",fromIndex,toIndex);
                
                // 往后移动
                if ((toIndex-fromIndex)>0) {
                    
                    // 从开始位置移动到结束位置
                    // 把移动view的下一个view移动到记录的view的位置(valuePoint)，并把下一view的位置记为新的nextPoint，并把view的tag值-1,依次类推
                    [UIView animateWithDuration:0.2 animations:^{
                        for (NSInteger i = fromIndex+1; i<=toIndex; i++) {
                            UIButton * nextBt = (UIButton*)[self.view viewWithTag:KBase_tag1+i];
                            nextPoint = nextBt.center;
                            nextBt.center = valuePoint;
                            valuePoint = nextPoint;
                            
                            nextBt.tag--;
                            
                            
                        }
                        recognizerView.tag = KBase_tag1 + toIndex;
                        
                        
                    }];
                    
                }
                // 往前移动
                else
                {
                    // 从开始位置移动到结束位置
                    // 把移动view的上一个view移动到记录的view的位置(valuePoint)，并把上一view的位置记为新的nextPoint，并把view的tag值+1,依次类推
                    [UIView animateWithDuration:0.2 animations:^{
                        for (NSInteger i = fromIndex-1; i>=toIndex; i--) {
                            UIButton * nextBt = (UIButton*)[self.view viewWithTag:KBase_tag1+i];
                            nextPoint = nextBt.center;
                            nextBt.center = valuePoint;
                            valuePoint = nextPoint;
                            
                            nextBt.tag++;
                            
                        }
                        recognizerView.tag = KBase_tag1 + toIndex;
                        
                        
                    }];
                    
                }
                
                
                
            }
            
        }
        
        
    }else if(recognizer.state == UIGestureRecognizerStateEnded){
        // 恢复其他按钮的拖拽手势
        for (UIButton * bt in self.view.subviews) {
            if (bt!=recognizerView) {
                bt.userInteractionEnabled = YES;
            }
        }
        
        // 结束时候恢复view的外观（放大，改变颜色等）
        [UIView animateWithDuration:0.2 animations:^{
            recognizerView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            recognizerView.alpha = 1;
            
            recognizerView.center = valuePoint;
        }];
    }
    
    
    
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
    CGFloat btW = (IphoneWidth-20*5)/4;
    CGFloat btH = 20;
    
    num1++;
    NSInteger btIndex = num1-1;
    
    UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(20+(20+btW)*(btIndex%4), 100 + (btIndex/4)*(btH+20), btW, btH);
    bt.backgroundColor = [UIColor redColor];
    bt.tag = KBase_tag1+btIndex;
    [bt setTitle:[NSString stringWithFormat:@"tag值%ld",bt.tag] forState:UIControlStateNormal];
    //[bt addTarget:self action:@selector(doDelete:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    
    // 长按手势
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [bt addGestureRecognizer:longPress];
    [btnArr1 addObject:bt];
 
}
//返回
- (void)back:(UIButton*)button
{


    [self.navigationController popToRootViewControllerAnimated:YES];
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
