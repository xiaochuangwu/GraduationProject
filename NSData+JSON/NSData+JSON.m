//
//  NSData+JSON.m
//  MySina_MVC
//
//  Created by SuperWang on 15/12/25.
//  Copyright (c) 2015年 智游. All rights reserved.
//

#import "NSData+JSON.h"

@implementation NSData (JSON)
-(NSDictionary*)JSONObject
{
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:&error];
    if (!error) {
        return dic;
    }
    NSLog(@"%@",error);
    return nil;
}

@end










