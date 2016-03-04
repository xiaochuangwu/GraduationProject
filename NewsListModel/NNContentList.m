//
//  NNContentList.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NNContentList.h"


NSString *const kNNContentListImgurl = @"imgurl";
NSString *const kNNContentListWeixin = @"weixin";
NSString *const kNNContentListTypeid = @"typeid";
NSString *const kNNContentListNewSource = @"new_source";
NSString *const kNNContentListNickname = @"nickname";
NSString *const kNNContentListTitle = @"title";
NSString *const kNNContentListAid = @"aid";
NSString *const kNNContentListLastId = @"lastId";
NSString *const kNNContentListVideourls = @"videourls";
NSString *const kNNContentListVideoCovers = @"videoCovers";
NSString *const kNNContentListReadNum = @"readNum";


@interface NNContentList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NNContentList

@synthesize imgurl = _imgurl;
@synthesize weixin = _weixin;
@synthesize typeide = _typeide;
@synthesize nnewSource = _nnewSource;
@synthesize nickname = _nickname;
@synthesize title = _title;
@synthesize aid = _aid;
@synthesize lastId = _lastId;
@synthesize videourls = _videourls;
@synthesize videoCovers = _videoCovers;
@synthesize readNum = _readNum;


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
            self.imgurl = [self objectOrNilForKey:kNNContentListImgurl fromDictionary:dict];
            self.weixin = [self objectOrNilForKey:kNNContentListWeixin fromDictionary:dict];
            self.typeide = [self objectOrNilForKey:kNNContentListTypeid fromDictionary:dict];
            self.nnewSource = [self objectOrNilForKey:kNNContentListNewSource fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kNNContentListNickname fromDictionary:dict];
            self.title = [self objectOrNilForKey:kNNContentListTitle fromDictionary:dict];
            self.aid = [self objectOrNilForKey:kNNContentListAid fromDictionary:dict];
            self.lastId = [self objectOrNilForKey:kNNContentListLastId fromDictionary:dict];
            self.videourls = [self objectOrNilForKey:kNNContentListVideourls fromDictionary:dict];
            self.videoCovers = [self objectOrNilForKey:kNNContentListVideoCovers fromDictionary:dict];
            self.readNum = [self objectOrNilForKey:kNNContentListReadNum fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgurl forKey:kNNContentListImgurl];
    [mutableDict setValue:self.weixin forKey:kNNContentListWeixin];
    [mutableDict setValue:self.typeide forKey:kNNContentListTypeid];
    [mutableDict setValue:self.nnewSource forKey:kNNContentListNewSource];
    [mutableDict setValue:self.nickname forKey:kNNContentListNickname];
    [mutableDict setValue:self.title forKey:kNNContentListTitle];
    [mutableDict setValue:self.aid forKey:kNNContentListAid];
    [mutableDict setValue:self.lastId forKey:kNNContentListLastId];
    [mutableDict setValue:self.videourls forKey:kNNContentListVideourls];
    [mutableDict setValue:self.videoCovers forKey:kNNContentListVideoCovers];
    [mutableDict setValue:self.readNum forKey:kNNContentListReadNum];

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

    self.imgurl = [aDecoder decodeObjectForKey:kNNContentListImgurl];
    self.weixin = [aDecoder decodeObjectForKey:kNNContentListWeixin];
    self.typeide = [aDecoder decodeObjectForKey:kNNContentListTypeid];
    self.nnewSource = [aDecoder decodeObjectForKey:kNNContentListNewSource];
    self.nickname = [aDecoder decodeObjectForKey:kNNContentListNickname];
    self.title = [aDecoder decodeObjectForKey:kNNContentListTitle];
    self.aid = [aDecoder decodeObjectForKey:kNNContentListAid];
    self.lastId = [aDecoder decodeObjectForKey:kNNContentListLastId];
    self.videourls = [aDecoder decodeObjectForKey:kNNContentListVideourls];
    self.videoCovers = [aDecoder decodeObjectForKey:kNNContentListVideoCovers];
    self.readNum = [aDecoder decodeObjectForKey:kNNContentListReadNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgurl forKey:kNNContentListImgurl];
    [aCoder encodeObject:_weixin forKey:kNNContentListWeixin];
    [aCoder encodeObject:_typeide forKey:kNNContentListTypeid];
    [aCoder encodeObject:_nnewSource forKey:kNNContentListNewSource];
    [aCoder encodeObject:_nickname forKey:kNNContentListNickname];
    [aCoder encodeObject:_title forKey:kNNContentListTitle];
    [aCoder encodeObject:_aid forKey:kNNContentListAid];
    [aCoder encodeObject:_lastId forKey:kNNContentListLastId];
    [aCoder encodeObject:_videourls forKey:kNNContentListVideourls];
    [aCoder encodeObject:_videoCovers forKey:kNNContentListVideoCovers];
    [aCoder encodeObject:_readNum forKey:kNNContentListReadNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    NNContentList *copy = [[NNContentList alloc] init];
    
    if (copy) {

        copy.imgurl = [self.imgurl copyWithZone:zone];
        copy.weixin = [self.weixin copyWithZone:zone];
        copy.typeide = [self.typeide copyWithZone:zone];
        copy.nnewSource = [self.nnewSource copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.aid = [self.aid copyWithZone:zone];
        copy.lastId = [self.lastId copyWithZone:zone];
        copy.videourls = [self.videourls copyWithZone:zone];
        copy.videoCovers = [self.videoCovers copyWithZone:zone];
        copy.readNum = [self.readNum copyWithZone:zone];
    }
    
    return copy;
}


@end
