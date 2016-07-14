//
//  NetRequest+Simple.m
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest+Simple.h"
#import "APIConfig.h"
#import "XStringUtils.h"

@implementation NetRequest (Simple)

/*
 sCid = 分类id
 sRegion = 定位地区城市名称（广州，深圳）
 
 sPage = 分页（第几页）
 sPagesize = 返回条数
 */
+(void)getSimpleCateList:(void(^)(id responseObject,NSError * error)) completionBlock
{
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"article_simple" action:@"getSimpleCateList" params:nil ] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
}

+(void)getSimpleListWithSPage:(NSString *)sPage
                 andSPagesize:(NSString *)sPagesize
                      andSCid:(NSString *)sCid
                   andSRegion:(NSString *)sRegion
           andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock
{
    NSString * parameStr = [XStringUtils jsonStringWithParameters:@{@"sPage":sPage,@"sPagesize":sPagesize,@"sCid":sCid,@"sRegion":sRegion} ];
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"article_simple" action:@"getSimpleList" params:parameStr ] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
}

//+(NSDictionary *)getParametersByMethod:(NSString *)method
//                                action:(NSString *)action
//                               params:(NSString *)params
//{
//    NSMutableDictionary *adic = [NSMutableDictionary dictionary];
//    if (![XStringUtils isTextEmpty:method]) {
//        [adic setValue:method forKey:@"m"];
//    }
//    if (![XStringUtils isTextEmpty:action]) {
//        [adic setValue:action forKey:@"a"];
//        
//    }
//    if (![XStringUtils isTextEmpty:params]) {
//        [adic setValue:params forKey:@"params"];
//    }
//    [adic setValue:@"iphone" forKey:@"phontType"];
//    [adic setValue:@"10000001" forKey:@"channelId"];
//    [adic  setValue:@"" forKey:@"sid"];
//    return adic;
//}


@end
