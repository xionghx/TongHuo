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
        [self setupUI];
    }
    return self;
}
-(void)setupUI
{
    UIImageView * backGroundView = [[UIImageView alloc]initWithFrame:SCREEN_BOUNDS];
    backGroundView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"登录页背景" ofType:@"png" inDirectory:@""]];
    [self addSubview:backGroundView];
    
    
    UIImageView * logoImageView = [[UIImageView alloc]init];
    logoImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"登录页MAMA-LOGO" ofType:@"png" inDirectory:@""]];
    [self addSubview:logoImageView];
    
    [backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self).multipliedBy(0.5);
        make.height.mas_equalTo(self).multipliedBy(0.5);
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self);
    }];
    
    UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"用微信账号登录" forState:UIControlStateNormal];
    loginButton.backgroundColor = MainColor;
    [self addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(40);
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).offset(200);
    }];
    
    UIButton * cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancleButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"登录页关闭按钮" ofType:@"png" inDirectory:@""]] forState:UIControlStateNormal];
//    cancleButton.backgroundColor = MainColor;
    [self addSubview:cancleButton];
    [cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.top.mas_equalTo(self.mas_top).offset(20);
    }];
    
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
