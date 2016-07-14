//
//  NetRequest+Simple.h
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest.h"

@interface NetRequest (Simple)
+(void)getSimpleCateList:(void(^)(id responseObject,NSError * error)) completionBlock;

+(void)getSimpleListWithSPage:(NSString *)sPage
                 andSPagesize:(NSString *)sPagesize
                      andSCid:(NSString *)sCid
                   andSRegion:(NSString *)sRegion
           andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock;


//+(NSDictionary *)getParametersByMethod:(NSString *)method
//                                action:(NSString *)action
//                               params:(NSString *)params;

@end
