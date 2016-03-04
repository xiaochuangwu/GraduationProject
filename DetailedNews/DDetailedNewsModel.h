//
//  DDetailedNewsModel.h
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DResult, DArticleInfo;

@interface DDetailedNewsModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) DResult *result;
@property (nonatomic, strong) DArticleInfo *articleInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
