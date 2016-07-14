//
//  NetRequest+DailyFavourites.m
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest+DailyFavourites.h"
#import "APIConfig.h"
#import "XStringUtils.h"

@implementation NetRequest (Article)
+(void)getOtherFavouritesWithsID:(NSString *)sDate
                       andStatus:(NSString *)sPage
                     andPagesize:(NSString *)sPagesize
              andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock
{
    NSString * parameStr = [XStringUtils jsonStringWithParameters:@{@"sDate":sDate,@"sPage":sPage,@"sPagesize":sPagesize}];
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"article_favourites" action:@"getOtherFavourites" params:parameStr ] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
}
+(void)getDailyFavourites:(void(^)(id responseObject,NSError * error)) completionBlock
{
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"article_favourites" action:@"getDailyFavourites" params:nil ] sucess:^(id responseObject) {
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

