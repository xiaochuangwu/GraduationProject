//
//  NNResult.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NNResult.h"


NSString *const kNNResultMsg = @"msg";
NSString *const kNNResultCode = @"code";


@interface NNResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NNResult

@synthesize msg = _msg;
@synthesize code = _code;


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
            self.msg = [self objectOrNilForKey:kNNResultMsg fromDictionary:dict];
            self.code = [[self objectOrNilForKey:kNNResultCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kNNResultMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kNNResultCode];

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

    self.msg = [aDecoder decodeObjectForKey:kNNResultMsg];
    self.code = [aDecoder decodeDoubleForKey:kNNResultCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kNNResultMsg];
    [aCoder encodeDouble:_code forKey:kNNResultCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    NNResult *copy = [[NNResult alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
