//
//  DataManager.m
//  GraduationProject
//
//  Created by mac on 16/3/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DataManager.h"

#import "MMenuModel.h"
@implementation DataManager


//请求新闻目录列表
+ (void)getNewsMenu:(CompletionBlock)block
{
    NSURL *url = [NSURL URLWithString:MENU_URL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"Error: %@", error);
    }];


}

//请求新闻列表
+ (void)getNewsListWithCateId:(NSString*)cateID completion:(CompletionBlock)block
{
    
    NSString *urlStr = [NSString stringWithFormat:@"%@&cateId=%@",NEWSLIST_URL,cateID];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
     


}

//请求新闻详情信息
+ (void)getDetailedNewsWithAid:(NSString*)aid completion:(CompletionBlock)block
{
    NSString *urlStr = [NSString stringWithFormat:@"%@aid=%@",DETAILEDNEWS_URL,aid];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];



}

//请求数据

+ (void)getDatasWithUrl:(NSString*)url completion:(CompletionBlock)block
{
    NSURL *URL = [NSURL URLWithString:url];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       // NSLog(@"%@",responseObject);
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];



}
@end
