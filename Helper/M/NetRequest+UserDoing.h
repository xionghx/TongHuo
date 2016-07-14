//
//  NetRequest+UserDoing.h
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest.h"

@interface NetRequest (UserDoing)
+(void)getUserDoingWithPage:(NSString *)sPage
                andPagesize:(NSString *)sPagesize
        andComplitionHandle:(void(^)(id responseObject,NSError *error)) complitionHandle;
//+(NSDictionary *)getParametersByMethod:(NSString *)method
//                                action:(NSString *)action
//                                params:(NSString *)params;
//
@end
