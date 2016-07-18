//
//  SpecialListCell.m
//  TongHuo
//
//  Created by xionghuaxin on 7/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "SpecialListCell.h"
#import "UIImageView+WebCache.h"

@interface SpecialListCell ()
@property(nonatomic,strong)UIView *separateView;
@property(nonatomic,strong)UIImageView *thumbImageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *introLabel;
@end

@implementation SpecialListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupValuesWith:(NSDictionary *)data
{
    [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:data[@"sThumb"]]];
    self.titleLabel.text = data[@"sTitle"];
    self.introLabel.text = data[@"sIntro"];
}
-(void)setupUI
{
    [self.contentView addSubview:self.separateView];
    [self.contentView addSubview:self.thumbImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.introLabel];
    
    [self.separateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(20);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(30);
    }];
    
    
    [self.thumbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.separateView.mas_bottom).offset(20);
        make.width.and.height.offset(100);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.thumbImageView.mas_bottom).offset(20);
        make.width.mas_equalTo(self).multipliedBy(0.8);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(self);
        make.height.offset(1);
    }];
    [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(20);
        make.width.mas_equalTo(self).multipliedBy(0.9);
        
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separateView);
        make.bottom.equalTo(self.introLabel).offset(20);
    }];
}
#pragma mark ----------------getter
-(UIView *)separateView
{
    if (_separateView == nil) {
        _separateView = [[UIView alloc]init];
        _separateView.backgroundColor = [UIColor grayColor];
        
    }
    return _separateView;
}
-(UIImageView *)thumbImageView
{
    if (_thumbImageView == nil) {
        _thumbImageView = [[UIImageView alloc]init];
        _thumbImageView.layer.cornerRadius = 50;
        _thumbImageView.layer.masksToBounds = YES;
        _thumbImageView.backgroundColor = [UIColor clearColor];
    }
    return _thumbImageView;
}
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
-(UIView *)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor blackColor];
    }
    return _lineView;
}
-(UILabel *)introLabel
{
    if (_introLabel == nil) {
        _introLabel = [[UILabel alloc]init];
        _introLabel.numberOfLines = 0;
    }
    return _introLabel;
}
@end
