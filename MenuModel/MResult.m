//
//  MResult.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MResult.h"


NSString *const kMResultMsg = @"msg";
NSString *const kMResultCode = @"code";


@interface MResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MResult

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
            self.msg = [self objectOrNilForKey:kMResultMsg fromDictionary:dict];
            self.code = [[self objectOrNilForKey:kMResultCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kMResultMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kMResultCode];

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

    self.msg = [aDecoder decodeObjectForKey:kMResultMsg];
    self.code = [aDecoder decodeDoubleForKey:kMResultCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kMResultMsg];
    [aCoder encodeDouble:_code forKey:kMResultCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    MResult *copy = [[MResult alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
