//
//  SpecialInfoCell.m
//  TongHuo
//
//  Created by xionghuaxin on 7/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "SpecialInfoCell.h"
@interface SpecialInfoCell ()
@property(nonatomic,strong)UIImageView *thumbImageView;
@property(nonatomic,strong)UILabel *titleLabel;

@end

@implementation SpecialInfoCell

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
    
}

-(void)setupUI
{
    [self.contentView addSubview:self.thumbImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.thumbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self).multipliedBy(3/4);
        
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.thumbImageView);
        make.width.mas_equalTo(self.thumbImageView).multipliedBy(0.8);
        make.width.mas_equalTo(self.thumbImageView).mas_equalTo(0.2);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.thumbImageView);
        make.bottom.equalTo(self.thumbImageView).offset(20);
    }];
}
-(UIImageView *)thumbImageView
{
    if (_thumbImageView == nil) {
        _thumbImageView = [[UIImageView alloc]init];
    }
    return _thumbImageView;
}
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.layer.borderWidth = 2;
        _titleLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return _titleLabel;
}
@end
