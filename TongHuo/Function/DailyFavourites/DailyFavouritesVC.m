//
//  DailyFavouritesVC.m
//  TongHuo
//
//  Created by xionghuaxin on 7/19/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "DailyFavouritesVC.h"

@interface DailyFavouritesVC ()
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UIButton *backButton;
@property(nonatomic,strong)UIWebView *dailyFavouriteWebView;


@end

@implementation DailyFavouritesVC
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadData];
        [self setupUI];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"专题详情";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _titleLabel.backgroundColor = [UIColor redColor];
    }
    return _titleLabel;
}


-(UIButton *)backButton
{
    if (_backButton == nil) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"黑色返回" ofType:@"png" inDirectory:@""]] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

-(void)setupUI
{
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.backButton];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(@64);
    }];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(self.view);
        make.width.and.height.equalTo(@30);
    }];
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)loadData
{
}

@end
