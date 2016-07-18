//
//  SpecialInfoCell.m
//  TongHuo
//
//  Created by xionghuaxin on 7/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "SpecialInfoCell.h"
#import "UIImageView+WebCache.h"

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
    [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:data[@"sThumb"]]];
    self.titleLabel.text = data[@"sTitle"];
}

-(void)setupUI
{
    [self.contentView addSubview:self.thumbImageView];
    [self.contentView addSubview:self.titleLabel];
    
    
    [self.thumbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self.mas_width).multipliedBy(0.75);
        
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.thumbImageView);
        make.width.mas_equalTo(self.thumbImageView).multipliedBy(0.8);
        make.height.mas_equalTo(self.thumbImageView).multipliedBy(0.2);
    }];
    
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.thumbImageView);
//        make.left.equalTo(self);
//        make.right.equalTo(self);
//        make.bottom.equalTo(self.thumbImageView).offset(10);
//    }];
}
-(UIImageView *)thumbImageView
{
    if (_thumbImageView == nil) {
        _thumbImageView = [[UIImageView alloc]init];
//        _thumbImageView.frame = CGRectMake(0, 0, SCREEN_W, 300);
//        _thumbImageView.backgroundColor = [UIColor redColor];
//        _thumbImageView.frame = self.bounds;
    }
    return _thumbImageView;
}
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.layer.borderWidth = 2;
        _titleLabel.numberOfLines = 0;
        _titleLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return _titleLabel;
}
@end
