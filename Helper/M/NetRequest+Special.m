//
//  NetRequest+Special.m
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest+Special.h"
#import "APIConfig.h"
#import "XStringUtils.h"
/*
 sCid = 分类id【预留】
 
 sPage = 分页（第几页）
 sPagesize = 返回条数
 */

@implementation NetRequest (Special)

+(void)getSpecialListWithId:(NSString *)sId
                    andPage:(NSString *)sPage
                andPagesize:(NSString *)sPagesize
                 completion:(void(^)(id responseObject,NSError *error))completionBlock
{
    NSString * parameStr = [XStringUtils jsonStringWithParameters:@{@"sId":sId,@"sPage":sPage,@"sPagesize":sPagesize} ];
    
    [NetRequest POST:POST_URL parameters:[self getParametersByMethod:@"special" action:@"getSpecialList" params:parameStr] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
        
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
}

+(void)getSpecialInfoWithId:(NSString *)sId
                    andPage:(NSString *)sPage
                andPagesize:(NSString *)sPagesize
                 completion:(void(^)(id responseObject,NSError *error))completionBlock
{
    NSString * parameStr = [XStringUtils jsonStringWithParameters:@{@"sId":sId,@"sPage":sPage,@"sPagesize":sPagesize} ];
    
    [NetRequest POST:POST_URL parameters:[self getParametersByMethod:@"special" action:@"getSpecialInfo" params:parameStr] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
        
    } failure:^(NSError *error) {
        completionBlock(nil,error);
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

