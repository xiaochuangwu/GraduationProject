//
//  NNContentList.h
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NNContentList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *imgurl;
@property (nonatomic, strong) NSString *weixin;
@property (nonatomic, strong) NSString *typeide;
@property (nonatomic, strong) NSString *nnewSource;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *aid;
@property (nonatomic, strong) NSString *lastId;
@property (nonatomic, assign) id videourls;
@property (nonatomic, assign) id videoCovers;
@property (nonatomic, strong) NSString *readNum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
