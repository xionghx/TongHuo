//
//  ArticleList_CatePageCell.m
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleList_CatePageCell.h"
#import "UIImageView+WebCache.h"
@interface ArticleList_CatePageCell ()

@end

@implementation ArticleList_CatePageCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}


-(void)setupUI
{
    WEAK_SELF
    [self.contentView addSubview:self.sThumbImageView];
    [self.contentView addSubview:self.sCatenameLabel];
    [self.contentView addSubview:self.sTitleLabel];
    [self.contentView addSubview:self.sHitnumLabel];
    
    [_sThumbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf).offset(15);
        make.left.mas_equalTo(weakSelf).offset(15);
        make.height.offset(100);
        make.width.offset(100*4/3);
    }];
    
    [_sCatenameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_sThumbImageView.mas_right).offset(15);
        make.top.mas_equalTo(_sThumbImageView);
        
    }];
    
    [_sTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_sThumbImageView.mas_right).offset(15);
        make.top.mas_equalTo(_sCatenameLabel.mas_bottom).offset(15);
        make.right.mas_equalTo(weakSelf).offset(-15);
    }];
    
    [_sHitnumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf).offset(-15);
        make.right.mas_equalTo(weakSelf).offset(-15);
    }];
    [weakSelf.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_sThumbImageView.mas_top).offset(-15);
        make.width.mas_equalTo(SCREEN_W);
        make.centerX.mas_equalTo(weakSelf);
        make.bottom.mas_equalTo(_sThumbImageView.mas_bottom).offset(15);
    }];
    
    
}



#pragma mark---geter
-(UIImageView *)sThumbImageView
{
    if (_sThumbImageView ==nil) {
        _sThumbImageView = [[UIImageView alloc]init];
    }
    return _sThumbImageView;
}

-(UILabel *)sCatenameLabel
{
    if (_sCatenameLabel == nil) {
        _sCatenameLabel =[[UILabel alloc]init];
        _sCatenameLabel.font = [UIFont systemFontOfSize:11];
    }
    return _sCatenameLabel;
}

-(UILabel *)sTitleLabel
{
    if (_sTitleLabel == nil) {
        _sTitleLabel =[[UILabel alloc]init];
        _sTitleLabel.numberOfLines = 2;
    }
    return _sTitleLabel;
}

-(UILabel *)sHitnumLabel
{
    if (_sHitnumLabel == nil) {
        _sHitnumLabel =[[UILabel alloc]init];
    }
    return _sHitnumLabel;
}

-(void)setupDataWitDataSource:(NSDictionary *)dataSource
{
    [self.sThumbImageView sd_setImageWithURL:[NSURL URLWithString:dataSource[@"sThumb"]]];
    self.sCatenameLabel.text = dataSource[@"sUsername"];
    self.sTitleLabel.text = dataSource[@"sTitle"];
    self.sHitnumLabel.text = [NSString stringWithFormat:@"%@浏览",dataSource[@"sHitnum"]];

}


@end

