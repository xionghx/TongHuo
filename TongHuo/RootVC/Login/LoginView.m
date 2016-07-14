//
//  LoginView.m
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "LoginView.h"
@interface LoginView ()

@end

@implementation LoginView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = MainColor;
        self.alpha = 0.1;
    }
    return self;
}
+(void)showLoginView
{
    static LoginView *loginView = nil;
    if (loginView == nil) {
        loginView = [[LoginView alloc]initWithFrame:SCREEN_BOUNDS];
    }
    [UIView animateWithDuration:0.3 animations:^{
        loginView.alpha = 1;
        [[UIApplication sharedApplication].keyWindow addSubview:loginView];

    }];
}
@end
