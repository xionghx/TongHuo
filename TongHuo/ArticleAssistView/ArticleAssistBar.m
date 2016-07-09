//
//  ArticleAssistBar.m
//  TongHuo
//
//  Created by xionghuanxin on 7/9/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleAssistBar.h"
#import "Masonry.h"

@interface ArticleAssistBar ()


@end


@implementation ArticleAssistBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 200, 20);
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(200, 30));
        }];
        self.backgroundColor = [UIColor greenColor];
        [self setLayout];
    }
    return self;
}
-(UIButton *)shareurlButton
{
    if (_shareurlButton == nil) {
        _shareurlButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareurlButton.translatesAutoresizingMaskIntoConstraints = false;
        [_shareurlButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"分享" ofType:@"png" inDirectory:@""]] forState:UIControlStateNormal];
    }
    return _shareurlButton;
}
-(UIButton *)collectTotalButton
{
    if (_collectTotalButton == nil) {
        _collectTotalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectTotalButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"收藏未选" ofType:@"png" inDirectory:@""]]  forState:UIControlStateNormal];
        [_collectTotalButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"收藏选中" ofType:@"png" inDirectory:@""]]  forState:UIControlStateSelected];
    }
    return _collectTotalButton;
}
-(ArticleAssistButton *)zanTotalButton
{
    if (_zanTotalButton == nil) {
        _zanTotalButton = [ArticleAssistButton buttonWithType:UIButtonTypeCustom];
        [_zanTotalButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"赞未选" ofType:@"png" inDirectory:@""]]  forState:UIControlStateNormal];
        [_zanTotalButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"赞" ofType:@"png" inDirectory:@""]]  forState:UIControlStateSelected];
        
    }
    return _zanTotalButton;
}
-(ArticleAssistButton *)comTotalButton
{
    if (_comTotalButton == nil) {
        _comTotalButton = [ArticleAssistButton buttonWithType:UIButtonTypeCustom];
        [_comTotalButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"评论数" ofType:@"png" inDirectory:@""]]  forState:UIControlStateNormal];
//        _comTotalButton.backgroundColor = [UIColor blackColor];
    }
    return _comTotalButton;
}

-(void)setLayout
{
    WEAK_SELF;
    [self addSubview:self.shareurlButton];
    [_shareurlButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self addSubview:self.collectTotalButton];
    [_collectTotalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_shareurlButton.mas_right).offset(10);
        make.bottom.equalTo(_shareurlButton.mas_bottom);
        make.size.equalTo(_shareurlButton);
    }];
    
    [self addSubview:self.zanTotalButton];
    [_zanTotalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_collectTotalButton.mas_right).offset(10);
        make.bottom.equalTo(_collectTotalButton.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(40, 20));
            }];
    [self addSubview:self.comTotalButton];
    [_comTotalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_zanTotalButton.mas_right).offset(10);
        make.bottom.equalTo(_zanTotalButton);
        make.size.mas_equalTo(CGSizeMake(40, 20));
    }];
}

@end
