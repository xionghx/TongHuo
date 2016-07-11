//
//  ArticleCateListCell.m
//  TongHuo
//
//  Created by xionghuanxin on 7/11/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleCateListCell.h"
#import "Masonry.h"
@interface ArticleCateListCell ()
@property(nonatomic,strong)UIView * lineView;
@property(nonatomic,strong)UIView * squreView;

@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * timeLabel;
@property(nonatomic,strong)UILabel *introLabel;

@property(nonatomic,strong)UIButton *linkButton;
@end

@implementation ArticleCateListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupLayout];
        self.backgroundColor =[UIColor greenColor];
    }
    return self;
}
-(void)setupLayout
{
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.squreView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.introLabel];
    [self.contentView addSubview:self.linkButton];
    
    
    WEAK_SELF
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.height.equalTo(weakSelf);
        make.left.mas_equalTo(weakSelf).offset(20);
        make.top.mas_equalTo(weakSelf).offset(0);
        
    }];
    
    [_squreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(6);
        make.height.equalTo(self.squreView.mas_width);
        make.centerX.mas_equalTo(weakSelf.lineView);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}
-(UIView *)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor blackColor];
    }
    return _lineView;
    
}
-(UIView *)squreView
{
    if (_squreView == nil) {
        _squreView = [[UIView alloc]init];
        _squreView.backgroundColor = [UIColor blackColor];
        _squreView.layer.cornerRadius = 3;
        _squreView.clipsToBounds = YES;
    }
    return _squreView;
}
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor blackColor];
        
    }
    return _titleLabel;
}
-(UILabel *)timeLabel
{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textColor = [UIColor darkGrayColor];
        _timeLabel.numberOfLines = 0;
    }
    return _timeLabel;
}
-(UILabel *)introLabel
{
    if (_introLabel == nil) {
        _introLabel = [[UILabel alloc]init];
        
    }
    return _introLabel;
    
}
-(UIButton *)linkButton
{
    if (_linkButton == nil) {
        _linkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_linkButton setTitle:@"[原文链接]" forState:UIControlStateNormal];
        _linkButton.titleLabel.textColor = [UIColor blueColor];
        _linkButton.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _linkButton;
}
@end
