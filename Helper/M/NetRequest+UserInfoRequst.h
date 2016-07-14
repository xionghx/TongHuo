//
//  NetRequest+UserInfoRequst.h
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest.h"

@interface NetRequest (UserInfoRequst)

+(void)userLoginWithUsername:(NSString *)sUsername
                    password:(NSString *)sPassword
                  completion:(void(^)(id responseObject,NSError *error))completionBlock;


//+(NSDictionary *)getParametersByMethod:(NSString *)method
//                                action:(NSString *)action
//                               params:(NSString *)params;
//
@end
