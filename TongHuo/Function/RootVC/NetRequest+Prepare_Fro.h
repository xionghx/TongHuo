//
//  NetRequest+Prepare_Fro.h
//  TongHuo
//
//  Created by xionghuanxin on 7/10/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NetRequest.h"

@interface NetRequest (Prepare_Fro)
+(void)shareArticleListWithCompletionBlock:(void(^)(id responseObject, NSError *error))completionBlock;
//@property(nonatomic,strong)NSMutableArray *articleList;
@end
