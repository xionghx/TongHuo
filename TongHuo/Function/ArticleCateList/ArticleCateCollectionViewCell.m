//
//  ArticleCateCollectionViewCell.m
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleCateCollectionViewCell.h"
#import "DataSourcePrepare.h"

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
    [self.contentView addSubview:self.sCimgView];
    [self.contentView addSubview:self.sCnameLabel];
    
    [_sCimgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_height).multipliedBy(0.5);
        make.height.equalTo(self.mas_height).multipliedBy(0.5);
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(5);
        
    }];
    
    [_sCnameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sCimgView.mas_bottom).offset(3);
        make.centerX.equalTo(self);
        make.height.equalTo(self.mas_height).multipliedBy(0.2);
    }];
}

-(UIImageView *)sCimgView
{
    if (_sCimgView == nil) {
        _sCimgView = [[UIImageView alloc]init];
        _sCimgView.layer.cornerRadius = 0.25 * self.height;
        _sCimgView.layer.borderWidth = 1;
        _sCimgView.clipsToBounds = YES;
    }
    return _sCimgView;
}

-(UILabel *)sCnameLabel
{
    if (_sCnameLabel == nil) {
        _sCnameLabel = [[UILabel alloc]init];
        _sCnameLabel.font = [UIFont systemFontOfSize:10];
    }
    return _sCnameLabel;
}

-(void)setupDataWithDataSource:(NSDictionary *)dataSource
{
    self.sCnameLabel.text = dataSource[@"sCname"];
    self.sCnameLabel.textColor =[dataSource[@"sCname"] isEqualToString:[DataSourcePrepare DataSource].selectedItem[@"sCname"]]? [UIColor blackColor]:[UIColor grayColor];
    NSString *imageStr =[dataSource[@"sCname"] isEqualToString:[DataSourcePrepare DataSource].selectedItem[@"sCname"]]? @"选中":@"未选";
    self.sCimgView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@%@",dataSource[@"sCname"],imageStr]  ofType:@"png" inDirectory:@""]];
    self.sCimgView.layer.borderColor = [dataSource[@"sCname"] isEqualToString:[DataSourcePrepare DataSource].selectedItem[@"sCname"]]?[UIColor blackColor].CGColor:[UIColor grayColor].CGColor;


}
@end
