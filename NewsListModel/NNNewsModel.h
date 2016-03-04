//
//  NNNewsModel.h
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NNResult;

@interface NNNewsModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NNResult *result;
@property (nonatomic, strong) NSArray *topList;
@property (nonatomic, strong) NSArray *contentList;
@property (nonatomic, assign) double count;
@property (nonatomic, assign) double topCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
