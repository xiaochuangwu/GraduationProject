//
//  MMenuModel.h
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MResult;

@interface MMenuModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) MResult *result;
@property (nonatomic, strong) NSArray *categoryList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
