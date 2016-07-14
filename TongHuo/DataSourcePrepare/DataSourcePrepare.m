//
//  DataSourcePrepare.m
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "DataSourcePrepare.h"
#import "NetRequest+Article.h"

@implementation DataSourcePrepare
+(instancetype)DataSource
{
    static dispatch_once_t onceToken;
    static DataSourcePrepare *dataSource = nil;
    dispatch_once(&onceToken, ^{
        dataSource = [[DataSourcePrepare alloc]init];
    });
    return dataSource;
}

@end
