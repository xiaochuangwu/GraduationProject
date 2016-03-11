//
//  DataManager.h
//  GraduationProject
//
//  Created by mac on 16/3/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


#define MENU_URL @"http://api.myhaowai.com/appsite_api/index/get_category_list?devid=f589425e6e9a56a9e345cc14efa5df3c&version=1.2.0&pcode=01100016"//目录标题url

#define NEWSLIST_URL @"http://api.myhaowai.com/appsite_api/category/get_category?devid=f589425e6e9a56a9e345cc14efa5df3c&version=1.2.0&pcode=01100016&direction=1&pageNumber=3&lastId=2016030321377"//新闻列表url

#define DETAILEDNEWS_URL @"http://api.myhaowai.com/appsite_api/html5/get_related_article_by_aid?"
//#define DETAILEDNEWS_URL @"http://api.myhaowai.com/appsite_api/article/get_article_by_aid?"
//定义一个请求成功的block
typedef void (^CompletionBlock)(NSDictionary* dic);
@interface DataManager : NSObject



//请求新闻目录列表
+ (void)getNewsMenu:(CompletionBlock)block;

//请求新闻列表

+ (void)getNewsListWithCateId:(NSString*)cateID completion:(CompletionBlock)block;

//请求新闻详情信息
+ (void)getDetailedNewsWithAid:(NSString*)aid completion:(CompletionBlock)block;



@end
