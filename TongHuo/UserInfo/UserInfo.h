//
//  UserInfo.h
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
/** 用户头像*/
@property (nonatomic,copy)NSString          *sAvator;
/** 宝宝年龄*/
@property (nonatomic,copy)NSString          *sBabyAge;
/** 宝宝性别*/
@property (nonatomic,copy)NSString          *sBabyGender;
/** 收藏总数*/
@property (nonatomic,copy)NSString          *sCollectTotal ;
/** 性别*/
@property (nonatomic,copy)NSString          *sGender;
/** 简介*/
@property (nonatomic,copy)NSString          *sIntro;
/** 消息总数*/
@property (nonatomic,copy)NSString          *sMsgTotal;
/** 昵称*/
@property (nonatomic,copy)NSString          *sNickname;
/** 所在地*/
@property (nonatomic,copy)NSString          *sProvince;
/** 用户名*/
@property (nonatomic,copy)NSString          *sUsername;
/** session*/
@property (nonatomic,copy)NSString          *sid;
@end
