//
//  LeftSideCell.m
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "LeftSideCell.h"
@interface LeftSideCell ()
@property(nonatomic,strong)UIImageView *cnameImage;
@property(nonatomic,strong)UILabel *cnameLabel;

@end

@implementation LeftSideCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cnameImage];
        [self.contentView addSubview:self.cnameLabel];
        [self.cnameImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.centerX.mas_equalTo(self).offset(-40);
            make.width.and.height.mas_equalTo(30);
        }];
        
        
        [self.cnameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.cnameImage.mas_right).offset(5);
            make.centerY.mas_equalTo(self);
        }];
    }
    return self;
    
}

-(void)setValueWithCname:(NSString *)cname
{
    self.cnameImage.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@选中",cname] ofType:@"png" inDirectory:@""]];
    self.cnameLabel.text = cname;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(UIImageView *)cnameImage
{
    if (_cnameImage == nil) {
        _cnameImage = [[UIImageView alloc]init];
    }
    return _cnameImage;
}
-(UILabel *)cnameLabel
{
    if (_cnameLabel == nil) {
        _cnameLabel = [[UILabel alloc]init];
        _cnameLabel.font = [UIFont systemFontOfSize:15];
    }
    return _cnameLabel;
}
@end
