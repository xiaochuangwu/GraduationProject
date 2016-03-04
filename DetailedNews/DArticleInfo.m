//
//  DArticleInfo.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "DArticleInfo.h"


NSString *const kDArticleInfoVideourls = @"videourls";
NSString *const kDArticleInfoDescription = @"description";
NSString *const kDArticleInfoWeixin = @"weixin";
NSString *const kDArticleInfoTitle = @"title";
NSString *const kDArticleInfoIsVideo = @"isVideo";
NSString *const kDArticleInfoVideoCovers = @"videoCovers";
NSString *const kDArticleInfoNickname = @"nickname";
NSString *const kDArticleInfoImgurl = @"imgurl";
NSString *const kDArticleInfoPubtime = @"pubtime";
NSString *const kDArticleInfoMsgSourceUrl = @"msg_source_url";
NSString *const kDArticleInfoOriginal = @"original";
NSString *const kDArticleInfoFlag = @"flag";
NSString *const kDArticleInfoShareUrl = @"shareUrl";
NSString *const kDArticleInfoVoteNum = @"voteNum";
NSString *const kDArticleInfoAid = @"aid";
NSString *const kDArticleInfoNewSource = @"new_source";
NSString *const kDArticleInfoWeixinUrl = @"weixinUrl";
NSString *const kDArticleInfoReadNum = @"readNum";
NSString *const kDArticleInfoCategoryId = @"category_id";
NSString *const kDArticleInfoContent = @"content";
NSString *const kDArticleInfoAuthor = @"author";


@interface DArticleInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DArticleInfo

@synthesize videourls = _videourls;
@synthesize articleInfoDescription = _articleInfoDescription;
@synthesize weixin = _weixin;
@synthesize title = _title;
@synthesize isVideo = _isVideo;
@synthesize videoCovers = _videoCovers;
@synthesize nickname = _nickname;
@synthesize imgurl = _imgurl;
@synthesize pubtime = _pubtime;
@synthesize msgSourceUrl = _msgSourceUrl;
@synthesize original = _original;
@synthesize flag = _flag;
@synthesize shareUrl = _shareUrl;
@synthesize voteNum = _voteNum;
@synthesize aid = _aid;
@synthesize newsSource = _newsSource;
@synthesize weixinUrl = _weixinUrl;
@synthesize readNum = _readNum;
@synthesize categoryId = _categoryId;
@synthesize content = _content;
@synthesize author = _author;


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
            self.videourls = [self objectOrNilForKey:kDArticleInfoVideourls fromDictionary:dict];
            self.articleInfoDescription = [self objectOrNilForKey:kDArticleInfoDescription fromDictionary:dict];
            self.weixin = [self objectOrNilForKey:kDArticleInfoWeixin fromDictionary:dict];
            self.title = [self objectOrNilForKey:kDArticleInfoTitle fromDictionary:dict];
            self.isVideo = [self objectOrNilForKey:kDArticleInfoIsVideo fromDictionary:dict];
            self.videoCovers = [self objectOrNilForKey:kDArticleInfoVideoCovers fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kDArticleInfoNickname fromDictionary:dict];
            self.imgurl = [self objectOrNilForKey:kDArticleInfoImgurl fromDictionary:dict];
            self.pubtime = [self objectOrNilForKey:kDArticleInfoPubtime fromDictionary:dict];
            self.msgSourceUrl = [self objectOrNilForKey:kDArticleInfoMsgSourceUrl fromDictionary:dict];
            self.original = [self objectOrNilForKey:kDArticleInfoOriginal fromDictionary:dict];
            self.flag = [self objectOrNilForKey:kDArticleInfoFlag fromDictionary:dict];
            self.shareUrl = [self objectOrNilForKey:kDArticleInfoShareUrl fromDictionary:dict];
            self.voteNum = [self objectOrNilForKey:kDArticleInfoVoteNum fromDictionary:dict];
            self.aid = [self objectOrNilForKey:kDArticleInfoAid fromDictionary:dict];
            self.newsSource = [self objectOrNilForKey:kDArticleInfoNewSource fromDictionary:dict];
            self.weixinUrl = [self objectOrNilForKey:kDArticleInfoWeixinUrl fromDictionary:dict];
            self.readNum = [self objectOrNilForKey:kDArticleInfoReadNum fromDictionary:dict];
            self.categoryId = [self objectOrNilForKey:kDArticleInfoCategoryId fromDictionary:dict];
            self.content = [self objectOrNilForKey:kDArticleInfoContent fromDictionary:dict];
            self.author = [self objectOrNilForKey:kDArticleInfoAuthor fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.videourls forKey:kDArticleInfoVideourls];
    [mutableDict setValue:self.articleInfoDescription forKey:kDArticleInfoDescription];
    [mutableDict setValue:self.weixin forKey:kDArticleInfoWeixin];
    [mutableDict setValue:self.title forKey:kDArticleInfoTitle];
    [mutableDict setValue:self.isVideo forKey:kDArticleInfoIsVideo];
    [mutableDict setValue:self.videoCovers forKey:kDArticleInfoVideoCovers];
    [mutableDict setValue:self.nickname forKey:kDArticleInfoNickname];
    [mutableDict setValue:self.imgurl forKey:kDArticleInfoImgurl];
    [mutableDict setValue:self.pubtime forKey:kDArticleInfoPubtime];
    [mutableDict setValue:self.msgSourceUrl forKey:kDArticleInfoMsgSourceUrl];
    [mutableDict setValue:self.original forKey:kDArticleInfoOriginal];
    [mutableDict setValue:self.flag forKey:kDArticleInfoFlag];
    [mutableDict setValue:self.shareUrl forKey:kDArticleInfoShareUrl];
    [mutableDict setValue:self.voteNum forKey:kDArticleInfoVoteNum];
    [mutableDict setValue:self.aid forKey:kDArticleInfoAid];
    [mutableDict setValue:self.newsSource forKey:kDArticleInfoNewSource];
    [mutableDict setValue:self.weixinUrl forKey:kDArticleInfoWeixinUrl];
    [mutableDict setValue:self.readNum forKey:kDArticleInfoReadNum];
    [mutableDict setValue:self.categoryId forKey:kDArticleInfoCategoryId];
    [mutableDict setValue:self.content forKey:kDArticleInfoContent];
    [mutableDict setValue:self.author forKey:kDArticleInfoAuthor];

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

    self.videourls = [aDecoder decodeObjectForKey:kDArticleInfoVideourls];
    self.articleInfoDescription = [aDecoder decodeObjectForKey:kDArticleInfoDescription];
    self.weixin = [aDecoder decodeObjectForKey:kDArticleInfoWeixin];
    self.title = [aDecoder decodeObjectForKey:kDArticleInfoTitle];
    self.isVideo = [aDecoder decodeObjectForKey:kDArticleInfoIsVideo];
    self.videoCovers = [aDecoder decodeObjectForKey:kDArticleInfoVideoCovers];
    self.nickname = [aDecoder decodeObjectForKey:kDArticleInfoNickname];
    self.imgurl = [aDecoder decodeObjectForKey:kDArticleInfoImgurl];
    self.pubtime = [aDecoder decodeObjectForKey:kDArticleInfoPubtime];
    self.msgSourceUrl = [aDecoder decodeObjectForKey:kDArticleInfoMsgSourceUrl];
    self.original = [aDecoder decodeObjectForKey:kDArticleInfoOriginal];
    self.flag = [aDecoder decodeObjectForKey:kDArticleInfoFlag];
    self.shareUrl = [aDecoder decodeObjectForKey:kDArticleInfoShareUrl];
    self.voteNum = [aDecoder decodeObjectForKey:kDArticleInfoVoteNum];
    self.aid = [aDecoder decodeObjectForKey:kDArticleInfoAid];
    self.newsSource = [aDecoder decodeObjectForKey:kDArticleInfoNewSource];
    self.weixinUrl = [aDecoder decodeObjectForKey:kDArticleInfoWeixinUrl];
    self.readNum = [aDecoder decodeObjectForKey:kDArticleInfoReadNum];
    self.categoryId = [aDecoder decodeObjectForKey:kDArticleInfoCategoryId];
    self.content = [aDecoder decodeObjectForKey:kDArticleInfoContent];
    self.author = [aDecoder decodeObjectForKey:kDArticleInfoAuthor];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_videourls forKey:kDArticleInfoVideourls];
    [aCoder encodeObject:_articleInfoDescription forKey:kDArticleInfoDescription];
    [aCoder encodeObject:_weixin forKey:kDArticleInfoWeixin];
    [aCoder encodeObject:_title forKey:kDArticleInfoTitle];
    [aCoder encodeObject:_isVideo forKey:kDArticleInfoIsVideo];
    [aCoder encodeObject:_videoCovers forKey:kDArticleInfoVideoCovers];
    [aCoder encodeObject:_nickname forKey:kDArticleInfoNickname];
    [aCoder encodeObject:_imgurl forKey:kDArticleInfoImgurl];
    [aCoder encodeObject:_pubtime forKey:kDArticleInfoPubtime];
    [aCoder encodeObject:_msgSourceUrl forKey:kDArticleInfoMsgSourceUrl];
    [aCoder encodeObject:_original forKey:kDArticleInfoOriginal];
    [aCoder encodeObject:_flag forKey:kDArticleInfoFlag];
    [aCoder encodeObject:_shareUrl forKey:kDArticleInfoShareUrl];
    [aCoder encodeObject:_voteNum forKey:kDArticleInfoVoteNum];
    [aCoder encodeObject:_aid forKey:kDArticleInfoAid];
    [aCoder encodeObject:_newsSource forKey:kDArticleInfoNewSource];
    [aCoder encodeObject:_weixinUrl forKey:kDArticleInfoWeixinUrl];
    [aCoder encodeObject:_readNum forKey:kDArticleInfoReadNum];
    [aCoder encodeObject:_categoryId forKey:kDArticleInfoCategoryId];
    [aCoder encodeObject:_content forKey:kDArticleInfoContent];
    [aCoder encodeObject:_author forKey:kDArticleInfoAuthor];
}

- (id)copyWithZone:(NSZone *)zone
{
    DArticleInfo *copy = [[DArticleInfo alloc] init];
    
    if (copy) {

        copy.videourls = [self.videourls copyWithZone:zone];
        copy.articleInfoDescription = [self.articleInfoDescription copyWithZone:zone];
        copy.weixin = [self.weixin copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.isVideo = [self.isVideo copyWithZone:zone];
        copy.videoCovers = [self.videoCovers copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.imgurl = [self.imgurl copyWithZone:zone];
        copy.pubtime = [self.pubtime copyWithZone:zone];
        copy.msgSourceUrl = [self.msgSourceUrl copyWithZone:zone];
        copy.original = [self.original copyWithZone:zone];
        copy.flag = [self.flag copyWithZone:zone];
        copy.shareUrl = [self.shareUrl copyWithZone:zone];
        copy.voteNum = [self.voteNum copyWithZone:zone];
        copy.aid = [self.aid copyWithZone:zone];
        copy.newsSource = [self.newsSource copyWithZone:zone];
        copy.weixinUrl = [self.weixinUrl copyWithZone:zone];
        copy.readNum = [self.readNum copyWithZone:zone];
        copy.categoryId = [self.categoryId copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
    }
    
    return copy;
}


@end
