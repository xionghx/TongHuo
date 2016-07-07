//
//  NetRequest+DailyFavourites.h
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest.h"

@interface NetRequest (DailyFavourites)
+(void)getOtherFavouritesWithsID:(NSString *)sDate
                       andStatus:(NSString *)sPage
                     andPagesize:(NSString *)sPagesize
              andCompletionBlock:(void(^)(id responseObject,NSError * error)) completionBlock;

+(NSDictionary *)getParametersByMethod:(NSString *)method
                                action:(NSString *)action
                               params:(NSString *)params;
//+(void)getDailyFavourites:(void(^)(id responseObject,NSError * error)) completionBlock;
@end
