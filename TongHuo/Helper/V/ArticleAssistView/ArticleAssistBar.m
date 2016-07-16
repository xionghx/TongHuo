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
        //        self.bounds = CGRectMake(0, 0, 200, 20);
        //        [self mas_makeConstraints:^(MASConstraintMaker *make) {
        ////            make.size.mas_equalTo(CGSizeMake(300, 60));
        //        }];
        //        self.backgroundColor = [UIColor greenColor];
//        [self setupUI];
    }
    return self;
}


-(void)layoutSubviews
{
    [self setupUI];
//    [super layoutSubviews];
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
        _zanTotalButton.titleLabel.font = [UIFont systemFontOfSize:11];
        
    }
    return _zanTotalButton;
}
-(ArticleAssistButton *)comTotalButton
{
    if (_comTotalButton == nil) {
        _comTotalButton = [ArticleAssistButton buttonWithType:UIButtonTypeCustom];
        [_comTotalButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"评论数" ofType:@"png" inDirectory:@""]]  forState:UIControlStateNormal];
        _comTotalButton.titleLabel.font = [UIFont systemFontOfSize:11];
        
    }
    return _comTotalButton;
}

-(void)setupUI
{
    

}

-(void)updateConstraints
{

    [self addSubview:self.shareurlButton];
    [self addSubview:self.collectTotalButton];
    [self addSubview:self.zanTotalButton];
    [self addSubview:self.comTotalButton];

[_shareurlButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self).offset(0.5 * self.height);
    make.bottom.equalTo(self);
    make.width.equalTo(self.mas_height);
    make.height.equalTo(self);
}];
[_collectTotalButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(_shareurlButton.mas_right).offset(0.5 * self.height);
    make.bottom.equalTo(_shareurlButton);
    make.size.equalTo(_shareurlButton);
}];

[_zanTotalButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.collectTotalButton.mas_right).offset(0.5 * self.height);
    make.bottom.equalTo(self.collectTotalButton);
    make.width.equalTo(self.shareurlButton).multipliedBy(3);
    make.height.equalTo(self.shareurlButton);
}];
[_comTotalButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(_zanTotalButton.mas_right).offset(0.5 * self.height);
    make.bottom.equalTo(_zanTotalButton);
    make.size.mas_equalTo(self.zanTotalButton);
}];

        [super updateConstraints];
}

@end
