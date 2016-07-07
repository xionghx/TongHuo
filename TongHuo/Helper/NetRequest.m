//
//  NetRequest.m
//  三方网络请求
//
//  Created by Iracle Zhang on 6/6/16.
//  Copyright © 2016 Iracle. All rights reserved.
//

#import "NetRequest.h"
#import "AFNetworking.h"
#import "XStringUtils.h"


typedef enum : NSUInteger {
    XRequestGet,
    XRequestPost,
} XRequestType;

@implementation NetRequest

+ (void)GET:(NSString *)url parameters:(NSDictionary *)parameters sucess:(void (^)(id))sucess failure:(void (^)(NSError *))failure {
    //初始化网络请求管理类
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //请求超时时间
    manager.requestSerializer.timeoutInterval = 10;
    //默认的提交数据格式是二进制格式，返回数据的格式是JSON格式
    //设置请求格式：二进制
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //设置返回数据格式：JSON
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //配置MIME类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    //GET请求
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //调用block
        sucess(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //调用block
        failure(error);
        
    }];
}

+ (void)POST:(NSString *)url parameters:(NSDictionary *)parameters sucess:(void (^)(id))sucess failure:(void (^)(NSError *))failure {
    //初始化网络请求管理类
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //请求超时时间
    manager.requestSerializer.timeoutInterval = 10;
    //默认的提交数据格式是二进制格式，返回数据的格式是JSON格式
    //设置请求格式：二进制
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //设置返回数据格式：JSON
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //配置MIME类型
    manager.responseSerializer.acceptableContentTypes = [NSSet  setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    //POST请求
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        sucess(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}
+(NSDictionary *)getParametersByMethod:(NSString *)method
                                action:(NSString *)action
                                params:(NSString *)params
{
    NSMutableDictionary *adic = [NSMutableDictionary dictionary];
    if (![XStringUtils isTextEmpty:method]) {
        [adic setValue:method forKey:@"m"];
    }
    if (![XStringUtils isTextEmpty:action]) {
        [adic setValue:action forKey:@"a"];
        
    }
    if (![XStringUtils isTextEmpty:params]) {
        [adic setValue:params forKey:@"params"];
    }
    [adic setValue:@"iphone" forKey:@"phontType"];
    [adic setValue:@"10000001" forKey:@"channelId"];
    [adic  setValue:@"" forKey:@"sid"];
    return adic;
}


@end










