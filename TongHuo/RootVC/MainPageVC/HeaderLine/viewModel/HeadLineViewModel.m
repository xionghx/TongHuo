//
//  HeadLineViewModel.m
//  MVVM_Demo
//
//  Created by huanxin xiong on 16/7/12.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "HeadLineViewModel.h"
#import "NetRequest+Simple.h"
#import "HeadLinesModel.h"



@interface HeadLineViewModel ()

@end


@implementation HeadLineViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _headlinearr = @[].mutableCopy;
    }
    return self;
}
-(void)sendRequestWithCid:(NSString*)sCid
                  sRegion:(NSString*)sRegion
                    sPage:(NSInteger)sPage
                    sSize:(NSInteger)sSize
                 callBack:(void(^)())callBack
{
//    [NetRequest getSimpleListWithSPage:sPage andSPagesize:[NSString stringWithFormat:@"%ld",sSize] andSCid:sCid andSRegion:sRegion andCompletionBlock:^(id responseObject, NSError *error) {
//        
//    }];
//    [LRequestUtils getHeadLinesListWithScid:sCid sRegion:sRegion sPage:sPage sPagesize:sSize completion:^(id content, BOOL success) {
//        
//        if (success) {
////            [self.headlinearr removeAllObjects];
//            for (NSDictionary * day in content[@"info"][@"data"]) {
//                NSMutableArray * everyDay = [NSMutableArray array];
//                for (NSDictionary * infoDic in day[@"sList"] ) {
//                    
//                    HeadLinesModel *model = [[HeadLinesModel alloc]init];
//                    [model setValuesForKeysWithDictionary:infoDic];
//                    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[model.sAddtime integerValue]];
//                    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
//                    [formatter setDateFormat:@"yyyy-MM-dd"];
//                    NSString * dateStr = [formatter stringFromDate:date];
//                    model.sAddtime = dateStr;
//                    [everyDay addObject:model];
//                }
//                [self.headlinearr addObject:everyDay];
//            }
//            callBack();
//        }
//    }];
}

-(void)tableViewHeaderRefreshWithCid:(NSString *)sCid
                             sRegion:(NSString *)sRegion
                               sPage:(NSInteger)sPage
                               sSize:(NSInteger)sSize
                            callBack:(void (^)())callBack
{
    [self sendRequestWithCid:sCid sRegion:sRegion sPage:sPage sSize:sSize callBack:^{
        callBack();
    }];
}

-(void)tableViewFooterRefreshWithCid:(NSString *)sCid
                             sRegion:(NSString *)sRegion
                               sPage:(NSInteger)sPage
                               sSize:(NSInteger)sSize
                            callBack:(void (^)())callBack
{
    [self sendRequestWithCid:sCid sRegion:sRegion sPage:sPage sSize:sSize callBack:^{
        callBack();
    }];
}
@end
