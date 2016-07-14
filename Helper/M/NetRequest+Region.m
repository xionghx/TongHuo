//
//  NetRequest+Region.m
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest+Region.h"
#import "APIConfig.h"
#import "XStringUtils.h"

@implementation NetRequest (Region)

+(void)getRegionGetListWithComplishedHandle:(void(^)(id responseObject,NSError * error))complishedHandle
{
    [NetRequest POST:POST_URL parameters:[self getParametersByMethod:@"region" action:@"regionGetList" params:nil ] sucess:^(id responseObject) {
        complishedHandle(responseObject,nil);
    } failure:^(NSError *error) {
        complishedHandle(nil,error);
    }];
}
    

//+(NSDictionary *)getParametersByMethod:(NSString *)method
//                                action:(NSString *)action
//                                params:(NSString *)params
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
