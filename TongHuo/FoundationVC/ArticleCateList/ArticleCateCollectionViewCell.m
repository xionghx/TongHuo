//
//  ArticleCateCollectionViewCell.m
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleCateCollectionViewCell.h"
@interface ArticleCateCollectionViewCell()

@end

@implementation ArticleCateCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI
{
    WEAK_SELF
    [self.contentView addSubview:self.sCimgView];
    [self.contentView addSubview:self.sCnameLabel];
    
    [_sCimgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weakSelf.mas_height).multipliedBy(0.5);
        make.height.equalTo(weakSelf.mas_height).multipliedBy(0.5);
        make.centerX.equalTo(weakSelf);
        make.top.equalTo(weakSelf).offset(5);
        
    }];
    
    [_sCnameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sCimgView.mas_bottom);
        make.centerX.equalTo(weakSelf);
        make.height.equalTo(weakSelf.mas_height).multipliedBy(0.2);
    }];
}

-(UIImageView *)sCimgView
{
    if (_sCimgView == nil) {
        _sCimgView = [[UIImageView alloc]init];
    }
    return _sCimgView;
}

-(UILabel *)sCnameLabel
{
    if (_sCnameLabel == nil) {
        _sCnameLabel = [[UILabel alloc]init];
    }
    return _sCnameLabel;
}

-(void)setupDataWithDataSource:(NSDictionary *)dataSource
{
    
}
@end
