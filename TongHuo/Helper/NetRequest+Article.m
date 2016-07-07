//
//  NetRequest+Article.m
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest+Article.h"
#import "APIConfig.h"
#import "XStringUtils.h"

@implementation NetRequest (Article)
+(void)addArticleCollectWithsID:(NSString *)sId
                     andsStatus:(NSString *)sStatus
             andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock
{
    NSString * parameStr = [XStringUtils jsonStringWithParameters:@{@"sId":sId,@"sStatus":sStatus}];
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"user_article" action:@"addArticleCollect" params:parameStr ] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
}


+(void)addArticleZanWithsID:(NSString *)sId
         andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock
{
    NSString * parameStr = [XStringUtils jsonStringWithParameters:@{@"sId":sId} ];
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"user_article" action:@"addArticleZan" params:parameStr ] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
    
}
-(void)test
{
//    NSLog(@"self:%@   self_p:%p    super:%@   super:%p",self,self,super,super);
}


+(void)test
{
    NSLog(@"self:%@   self_p:%p",self,self);
}
+(void)addArticleCommentWithsID:(NSString *)sId
                   andSContent :(NSString *)sContent
             andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock
{
    NSString * parameStr = [XStringUtils jsonStringWithParameters:@{@"sId":sId,@"sContent":sContent } ];
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"user_article" action:@"addArticleComment" params:parameStr ] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
    
}

+(void)getCommentListWithId:(NSString *)sId
                      SPage:(NSString *)sPage
                  andSPagesize:(NSString *)sPagesize
            andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock
{
    NSString * parameStr = [XStringUtils jsonStringWithParameters:@{@"sId":sId,@"sPage":sPage,@"sPagesize":sPagesize} ];
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"article_comment" action:@"getCommentList" params:parameStr ] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
    
}


+(void)getArticleInfoWithsID:(NSString *)sId
          andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock
{
    NSString * parameStr = [XStringUtils jsonStringWithParameters:@{@"sId":sId} ];
    
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"article" action:@"getArticleInfo" params:parameStr] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
    
}
+(void)getArticleListWithSPage:(NSString *)sPage
                  andSPagesize:(NSString *)sPagesize
            andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock
{
    
    NSString * parameStr = [XStringUtils jsonStringWithParameters:@{@"sPage":sPage,@"sPagesize":sPagesize} ];
    
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"article" action:@"getArticleList" params:parameStr ] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
}


+(void)getArticleTagList:(void(^)(id responseObject,NSError * error)) completionBlock
{
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"article" action:@"getArticleTagList" params:nil ] sucess:^(id responseObject) {
        completionBlock(responseObject,nil);
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
}


+(void)getArticleCateList:(void(^)(id responseObject,NSError * error)) completionBlock
{
    [NetRequest POST:POST_URL  parameters:[self getParametersByMethod:@"article" action:@"getArticleCateList" params:nil ] sucess:^(id responseObject) {
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
