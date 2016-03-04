//
//  DArticleInfo.h
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DArticleInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id videourls;
@property (nonatomic, strong) NSString *articleInfoDescription;
@property (nonatomic, strong) NSString *weixin;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *isVideo;
@property (nonatomic, assign) id videoCovers;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *imgurl;
@property (nonatomic, strong) NSString *pubtime;
@property (nonatomic, strong) NSString *msgSourceUrl;
@property (nonatomic, assign) id original;
@property (nonatomic, strong) NSString *flag;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) NSString *voteNum;
@property (nonatomic, strong) NSString *aid;
@property (nonatomic, strong) NSString *newsSource;
@property (nonatomic, strong) NSString *weixinUrl;
@property (nonatomic, strong) NSString *readNum;
@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) id author;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
