//
//  MCategoryList.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MCategoryList.h"


NSString *const kMCategoryListTypeid = @"typeid";
NSString *const kMCategoryListImgurl = @"imgurl";
NSString *const kMCategoryListCityCode = @"cityCode";
NSString *const kMCategoryListIosKey = @"ios_key";
NSString *const kMCategoryListCategoryName = @"category_name";
NSString *const kMCategoryListFlag = @"flag";
NSString *const kMCategoryListWeatherCode = @"weatherCode";
NSString *const kMCategoryListType = @"type";
NSString *const kMCategoryListIsArea = @"is_area";
NSString *const kMCategoryListAndroidKey = @"android_key";


@interface MCategoryList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MCategoryList

@synthesize typeid = _typeid;
@synthesize imgurl = _imgurl;
@synthesize cityCode = _cityCode;
@synthesize iosKey = _iosKey;
@synthesize categoryName = _categoryName;
@synthesize flag = _flag;
@synthesize weatherCode = _weatherCode;
@synthesize type = _type;
@synthesize isArea = _isArea;
@synthesize androidKey = _androidKey;


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
            self.typeid = [self objectOrNilForKey:kMCategoryListTypeid fromDictionary:dict];
            self.imgurl = [self objectOrNilForKey:kMCategoryListImgurl fromDictionary:dict];
            self.cityCode = [self objectOrNilForKey:kMCategoryListCityCode fromDictionary:dict];
            self.iosKey = [self objectOrNilForKey:kMCategoryListIosKey fromDictionary:dict];
            self.categoryName = [self objectOrNilForKey:kMCategoryListCategoryName fromDictionary:dict];
            self.flag = [self objectOrNilForKey:kMCategoryListFlag fromDictionary:dict];
            self.weatherCode = [self objectOrNilForKey:kMCategoryListWeatherCode fromDictionary:dict];
            self.type = [self objectOrNilForKey:kMCategoryListType fromDictionary:dict];
            self.isArea = [self objectOrNilForKey:kMCategoryListIsArea fromDictionary:dict];
            self.androidKey = [self objectOrNilForKey:kMCategoryListAndroidKey fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.typeid forKey:kMCategoryListTypeid];
    [mutableDict setValue:self.imgurl forKey:kMCategoryListImgurl];
    [mutableDict setValue:self.cityCode forKey:kMCategoryListCityCode];
    [mutableDict setValue:self.iosKey forKey:kMCategoryListIosKey];
    [mutableDict setValue:self.categoryName forKey:kMCategoryListCategoryName];
    [mutableDict setValue:self.flag forKey:kMCategoryListFlag];
    [mutableDict setValue:self.weatherCode forKey:kMCategoryListWeatherCode];
    [mutableDict setValue:self.type forKey:kMCategoryListType];
    [mutableDict setValue:self.isArea forKey:kMCategoryListIsArea];
    [mutableDict setValue:self.androidKey forKey:kMCategoryListAndroidKey];

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

    self.typeid = [aDecoder decodeObjectForKey:kMCategoryListTypeid];
    self.imgurl = [aDecoder decodeObjectForKey:kMCategoryListImgurl];
    self.cityCode = [aDecoder decodeObjectForKey:kMCategoryListCityCode];
    self.iosKey = [aDecoder decodeObjectForKey:kMCategoryListIosKey];
    self.categoryName = [aDecoder decodeObjectForKey:kMCategoryListCategoryName];
    self.flag = [aDecoder decodeObjectForKey:kMCategoryListFlag];
    self.weatherCode = [aDecoder decodeObjectForKey:kMCategoryListWeatherCode];
    self.type = [aDecoder decodeObjectForKey:kMCategoryListType];
    self.isArea = [aDecoder decodeObjectForKey:kMCategoryListIsArea];
    self.androidKey = [aDecoder decodeObjectForKey:kMCategoryListAndroidKey];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_typeid forKey:kMCategoryListTypeid];
    [aCoder encodeObject:_imgurl forKey:kMCategoryListImgurl];
    [aCoder encodeObject:_cityCode forKey:kMCategoryListCityCode];
    [aCoder encodeObject:_iosKey forKey:kMCategoryListIosKey];
    [aCoder encodeObject:_categoryName forKey:kMCategoryListCategoryName];
    [aCoder encodeObject:_flag forKey:kMCategoryListFlag];
    [aCoder encodeObject:_weatherCode forKey:kMCategoryListWeatherCode];
    [aCoder encodeObject:_type forKey:kMCategoryListType];
    [aCoder encodeObject:_isArea forKey:kMCategoryListIsArea];
    [aCoder encodeObject:_androidKey forKey:kMCategoryListAndroidKey];
}

- (id)copyWithZone:(NSZone *)zone
{
    MCategoryList *copy = [[MCategoryList alloc] init];
    
    if (copy) {

        copy.typeid = [self.typeid copyWithZone:zone];
        copy.imgurl = [self.imgurl copyWithZone:zone];
        copy.cityCode = [self.cityCode copyWithZone:zone];
        copy.iosKey = [self.iosKey copyWithZone:zone];
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.flag = [self.flag copyWithZone:zone];
        copy.weatherCode = [self.weatherCode copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.isArea = [self.isArea copyWithZone:zone];
        copy.androidKey = [self.androidKey copyWithZone:zone];
    }
    
    return copy;
}


@end
