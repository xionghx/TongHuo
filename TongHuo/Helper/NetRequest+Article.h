//
//  NetRequest+Article.h
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest.h"


@interface NetRequest (Article)
+(void)test;
-(void)test;

+(void)addArticleZanWithsID:(NSString *)sId
         andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock;

+(void)addArticleCommentWithsID:(NSString *)sId
                   andSContent :(NSString *)sContent
             andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock;

+(void)getArticleListWithCid:(NSString *)sCid
                    andTname:(NSString *)sTname
                  andKeyWord:(NSString *)sKeyWord
                       SPage:(NSString *)sPage
                andSPagesize:(NSString *)sPagesize
          andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock;

+(void)getArticleInfoWithsID:(NSString *)sId
          andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock;

//+(void)getArticleListWithSPage:(NSString *)sPage
//                  andSPagesize:(NSString *)sPagesize
//            andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock;

+(void)getArticleTagList:(void(^)(id responseObject,NSError * error)) completionBlock;

+(void)getArticleCateList:(void(^)(id responseObject,NSError * error)) completionBlock;

//+(NSDictionary *)getParametersByMethod:(NSString *)method
//                                action:(NSString *)action
//                               params:(NSString *)params;

@end
