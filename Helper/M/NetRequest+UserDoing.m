//
//  NetRequest+UserDoing.m
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest+UserDoing.h"
#import "APIConfig.h"
#import "XStringUtils.h"

@implementation NetRequest (UserDoing)

+(void)getUserDoingWithPage:(NSString *)sPage
                andPagesize:(NSString *)sPagesize
        andComplitionHandle:(void(^)(id responseObject,NSError *error)) complitionHandle
{
    NSString *params = [XStringUtils jsonStringWithParameters:@{@"sPage":sPage,@"sPagesize":sPagesize}];
    [NetRequest POST:POST_URL parameters:[self getParametersByMethod:@"user_doing" action:@"getUserDoing" params:params] sucess:^(id responseObject) {
        complitionHandle(responseObject,nil);
    } failure:^(NSError *error) {
        complitionHandle(nil,error);
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
