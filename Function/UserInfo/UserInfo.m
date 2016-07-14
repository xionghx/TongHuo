//
//  UserInfo.m
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo
+(instancetype)currentUser
{
    static dispatch_once_t onceToken;
    static UserInfo *currentUser = nil;
    dispatch_once(&onceToken, ^{
        currentUser = [[UserInfo alloc]init];
    });
    return currentUser;
}



@end
