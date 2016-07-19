//
//  UserInfoViewController.m
//  TongHuo
//
//  Created by xionghuaxin on 7/19/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()
@property(nonatomic, strong)UIButton *backButton;
@property(nonatomic, strong)UIImageView *backGroudView;
@property(nonatomic, strong)UIButton *loginButton;
@property(nonatomic, strong)UILabel *loginLabel;
@property(nonatomic, strong)UIButton *userInfoSetButton;
@property(nonatomic, strong)UIButton *collectTotalButton;
@property(nonatomic, strong)UIButton *infoTransportButton;
@property(nonatomic, strong)UIButton *settingButton;
@property(nonatomic, strong)UITableView *mamaNewsView;

@end

@implementation UserInfoViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];

    }
    return self;
}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//}
-(void)setupUI
{
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.backGroudView];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.loginLabel];
    [self.view addSubview:self.userInfoSetButton];
    [self.view addSubview:self.collectTotalButton];
    [self.view addSubview:self.infoTransportButton];
    [self.view addSubview:self.settingButton];
    [self.backGroudView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.35);
    }];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(10);
        make.top.mas_equalTo(self.view).offset(20);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.backGroudView).offset(-20);
        make.width.and.height.offset(80);
    }];
    [self.loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(30);
        make.width.mas_equalTo(self.loginButton).multipliedBy(0.5);
        make.height.mas_equalTo(self.loginButton).multipliedBy(0.1);
    }];
    [self.userInfoSetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.loginLabel);
        make.left.mas_equalTo(self.loginLabel.mas_right).offset(40);
        make.width.and.height.offset(15);
    }];

    [self.collectTotalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backGroudView.mas_bottom);
        make.left.mas_equalTo(self.view);
        make.height.offset(50);
    }];
    self.collectTotalButton.imageEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 80);
    [self.infoTransportButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.collectTotalButton.mas_right);
        make.width.and.height.mas_equalTo(self.collectTotalButton);
        make.top.mas_equalTo(self.backGroudView.mas_bottom);
    }];
    self.infoTransportButton.imageEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 80);

    [self.settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.infoTransportButton.mas_right);
        make.width.and.height.mas_equalTo(self.collectTotalButton);
        make.top.mas_equalTo(self.backGroudView.mas_bottom);
        make.right.mas_equalTo(self.view);
    }];
    self.settingButton.imageEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 80);

}
-(UIImageView *)backGroudView
{
    if (_backGroudView == nil) {
        _backGroudView = [[UIImageView alloc]init];
        _backGroudView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"登录页背景" ofType:@"png" inDirectory:@""]];
    }
    return _backGroudView;
}

-(UIButton *)backButton
{
    if (_backButton == nil) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"白色返回" ofType:@"png" inDirectory:@""]] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}
-(UIButton *)loginButton
{
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.layer.cornerRadius = 40;
        _loginButton.layer.borderWidth = 3;
        _loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
        [_loginButton setBackgroundColor:MainColor];
        [_loginButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"登录页背景" ofType:@"" inDirectory:@""]] forState:UIControlStateNormal];
    }
    return _loginButton;
}
-(UILabel *)loginLabel
{
    if (_loginLabel == nil) {
        _loginLabel = [[UILabel alloc]init];
        _loginLabel.text = @"登录";
        _loginLabel.textColor = [UIColor whiteColor];
        _loginLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _loginLabel;
}
-(UIButton *)userInfoSetButton
{
    if (_userInfoSetButton == nil) {
        _userInfoSetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_userInfoSetButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"编辑" ofType:@"png" inDirectory:@""]] forState:UIControlStateNormal];
    }
    return _userInfoSetButton;
    
}
-(UIButton *)collectTotalButton
{
    if (_collectTotalButton == nil) {
        _collectTotalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectTotalButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"收藏选中" ofType:@"png" inDirectory:@""]] forState:UIControlStateNormal];
        NSLog(@"%@",[[NSBundle mainBundle] pathForResource:@"收藏选中" ofType:@"png" inDirectory:@""]);

    }
    return _collectTotalButton;
}
-(UIButton *)infoTransportButton
{
    if (_infoTransportButton == nil) {
        _infoTransportButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_infoTransportButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"传书" ofType:@"png" inDirectory:@""]] forState:UIControlStateNormal];
    }
    return _infoTransportButton;
}
-(UIButton *)settingButton
{
    if (_settingButton == nil) {
        _settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_settingButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"设置" ofType:@"png" inDirectory:@""]] forState:UIControlStateNormal];
    }
    return _settingButton;
}
//-(UITableView)
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
