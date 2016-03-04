//
//  MCategoryList.h
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MCategoryList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *typeid;
@property (nonatomic, strong) NSString *imgurl;
@property (nonatomic, strong) NSString *cityCode;
@property (nonatomic, strong) NSString *iosKey;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *flag;
@property (nonatomic, strong) NSString *weatherCode;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *isArea;
@property (nonatomic, strong) NSString *androidKey;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
