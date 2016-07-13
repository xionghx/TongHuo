//
//  HeadLineViewModel.h
//  MVVM_Demo
//
//  Created by huanxin xiong on 16/7/12.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeadLineViewModel : NSObject
-(void)sendRequestWithCid:(NSString*)sCid
                  sRegion:(NSString*)sRegion
                    sPage:(NSInteger)sPage
                    sSize:(NSInteger)sSize
                 callBack:(void(^)())callBack;
-(void)tableViewHeaderRefreshWithCid:(NSString *)sCid
                             sRegion:(NSString *)sRegion
                               sPage:(NSInteger)sPage
                               sSize:(NSInteger)sSize
                            callBack:(void (^)())callBack;
-(void)tableViewFooterRefreshWithCid:(NSString *)sCid
                             sRegion:(NSString *)sRegion
                               sPage:(NSInteger)sPage
                               sSize:(NSInteger)sSize
                            callBack:(void (^)())callBack;


@property(nonatomic,strong)NSMutableArray *headlinearr;

@end
