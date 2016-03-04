//
//  DDetailedNewsModel.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "DDetailedNewsModel.h"
#import "DResult.h"
#import "DArticleInfo.h"


NSString *const kDDetailedNewsModelResult = @"result";
NSString *const kDDetailedNewsModelArticleInfo = @"article_info";


@interface DDetailedNewsModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DDetailedNewsModel

@synthesize result = _result;
@synthesize articleInfo = _articleInfo;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.result = [DResult modelObjectWithDictionary:[dict objectForKey:kDDetailedNewsModelResult]];
            self.articleInfo = [DArticleInfo modelObjectWithDictionary:[dict objectForKey:kDDetailedNewsModelArticleInfo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kDDetailedNewsModelResult];
    [mutableDict setValue:[self.articleInfo dictionaryRepresentation] forKey:kDDetailedNewsModelArticleInfo];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.result = [aDecoder decodeObjectForKey:kDDetailedNewsModelResult];
    self.articleInfo = [aDecoder decodeObjectForKey:kDDetailedNewsModelArticleInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kDDetailedNewsModelResult];
    [aCoder encodeObject:_articleInfo forKey:kDDetailedNewsModelArticleInfo];
}

- (id)copyWithZone:(NSZone *)zone
{
    DDetailedNewsModel *copy = [[DDetailedNewsModel alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.articleInfo = [self.articleInfo copyWithZone:zone];
    }
    
    return copy;
}


@end
