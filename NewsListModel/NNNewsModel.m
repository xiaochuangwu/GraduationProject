//
//  NNNewsModel.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NNNewsModel.h"
#import "NNResult.h"
#import "NNContentList.h"


NSString *const kNNNewsModelResult = @"result";
NSString *const kNNNewsModelTopList = @"topList";
NSString *const kNNNewsModelContentList = @"contentList";
NSString *const kNNNewsModelCount = @"count";
NSString *const kNNNewsModelTopCount = @"topCount";


@interface NNNewsModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NNNewsModel

@synthesize result = _result;
@synthesize topList = _topList;
@synthesize contentList = _contentList;
@synthesize count = _count;
@synthesize topCount = _topCount;


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
            self.result = [NNResult modelObjectWithDictionary:[dict objectForKey:kNNNewsModelResult]];
            self.topList = [self objectOrNilForKey:kNNNewsModelTopList fromDictionary:dict];
    NSObject *receivedNNContentList = [dict objectForKey:kNNNewsModelContentList];
    NSMutableArray *parsedNNContentList = [NSMutableArray array];
    if ([receivedNNContentList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNNContentList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNNContentList addObject:[NNContentList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNNContentList isKindOfClass:[NSDictionary class]]) {
       [parsedNNContentList addObject:[NNContentList modelObjectWithDictionary:(NSDictionary *)receivedNNContentList]];
    }

    self.contentList = [NSArray arrayWithArray:parsedNNContentList];
            self.count = [[self objectOrNilForKey:kNNNewsModelCount fromDictionary:dict] doubleValue];
            self.topCount = [[self objectOrNilForKey:kNNNewsModelTopCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kNNNewsModelResult];
    NSMutableArray *tempArrayForTopList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.topList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTopList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTopList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTopList] forKey:kNNNewsModelTopList];
    NSMutableArray *tempArrayForContentList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.contentList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForContentList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForContentList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForContentList] forKey:kNNNewsModelContentList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kNNNewsModelCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.topCount] forKey:kNNNewsModelTopCount];

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

    self.result = [aDecoder decodeObjectForKey:kNNNewsModelResult];
    self.topList = [aDecoder decodeObjectForKey:kNNNewsModelTopList];
    self.contentList = [aDecoder decodeObjectForKey:kNNNewsModelContentList];
    self.count = [aDecoder decodeDoubleForKey:kNNNewsModelCount];
    self.topCount = [aDecoder decodeDoubleForKey:kNNNewsModelTopCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kNNNewsModelResult];
    [aCoder encodeObject:_topList forKey:kNNNewsModelTopList];
    [aCoder encodeObject:_contentList forKey:kNNNewsModelContentList];
    [aCoder encodeDouble:_count forKey:kNNNewsModelCount];
    [aCoder encodeDouble:_topCount forKey:kNNNewsModelTopCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    NNNewsModel *copy = [[NNNewsModel alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.topList = [self.topList copyWithZone:zone];
        copy.contentList = [self.contentList copyWithZone:zone];
        copy.count = self.count;
        copy.topCount = self.topCount;
    }
    
    return copy;
}


@end
