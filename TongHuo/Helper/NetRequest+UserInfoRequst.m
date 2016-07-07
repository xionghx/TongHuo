//
//  NetRequest+UserInfoRequst.m
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest+UserInfoRequst.h"
#import "APIConfig.h"
#import "XStringUtils.h"
@implementation NetRequest (UserInfoRequst)

+(void)userLoginWithUsername:(NSString *)sUsername
                    password:(NSString *)sPassword
                  completion:(void(^)(id responseObject,NSError *error))completionBlock
{
    NSString * parameStr = [XStringUtils jsonStringWithParameters:@{@"sUsername":sUsername,@"sPassword":[XStringUtils md5HexDigestWithString:sPassword]} ];
    
    [NetRequest POST:POST_URL parameters:[self getParametersByMethod:@"user" action:@"userLogin" params:parameStr] sucess:^(id responseObject) {
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
//


@end
