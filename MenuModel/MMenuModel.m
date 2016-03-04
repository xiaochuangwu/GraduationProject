//
//  MMenuModel.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MMenuModel.h"
#import "MResult.h"
#import "MCategoryList.h"


NSString *const kMMenuModelResult = @"result";
NSString *const kMMenuModelCategoryList = @"category_list";


@interface MMenuModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MMenuModel

@synthesize result = _result;
@synthesize categoryList = _categoryList;


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
            self.result = [MResult modelObjectWithDictionary:[dict objectForKey:kMMenuModelResult]];
    NSObject *receivedMCategoryList = [dict objectForKey:kMMenuModelCategoryList];
    NSMutableArray *parsedMCategoryList = [NSMutableArray array];
    if ([receivedMCategoryList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMCategoryList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMCategoryList addObject:[MCategoryList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMCategoryList isKindOfClass:[NSDictionary class]]) {
       [parsedMCategoryList addObject:[MCategoryList modelObjectWithDictionary:(NSDictionary *)receivedMCategoryList]];
    }

    self.categoryList = [NSArray arrayWithArray:parsedMCategoryList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kMMenuModelResult];
    NSMutableArray *tempArrayForCategoryList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.categoryList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCategoryList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCategoryList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCategoryList] forKey:kMMenuModelCategoryList];

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

    self.result = [aDecoder decodeObjectForKey:kMMenuModelResult];
    self.categoryList = [aDecoder decodeObjectForKey:kMMenuModelCategoryList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kMMenuModelResult];
    [aCoder encodeObject:_categoryList forKey:kMMenuModelCategoryList];
}

- (id)copyWithZone:(NSZone *)zone
{
    MMenuModel *copy = [[MMenuModel alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.categoryList = [self.categoryList copyWithZone:zone];
    }
    
    return copy;
}


@end
