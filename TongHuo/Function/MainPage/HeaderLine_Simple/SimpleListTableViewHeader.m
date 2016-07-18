//
//  SimpleListTableViewHeader.m
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "SimpleListTableViewHeader.h"

@implementation SimpleListTableViewHeader

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
//        self.frame = CGRectMake(0, 0, SCREEN_W, 50);
        [self setupUI];
    }
    return self;
}
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
    [self addSubview:self.lineView];
    [self addSubview:self.tableHeaderLabelOne];
    [self addSubview:self.tableHeaderLabelTwo];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.height.equalTo(self);
        make.left.mas_equalTo(self).offset(20);
        make.top.mas_equalTo(self).offset(0);
    }];

    [_tableHeaderLabelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.mas_equalTo(self.mas_height).multipliedBy(0.6);
        make.centerX.mas_equalTo(self.mas_left).offset(20);
        make.centerY.mas_equalTo(self);
    }];
    
    [_tableHeaderLabelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_tableHeaderLabelOne.mas_right).offset(20);
        make.centerY.mas_equalTo(_tableHeaderLabelOne);
        make.height.equalTo(_tableHeaderLabelOne).multipliedBy(0.5);
    }];

}

//-(UIView *)tableHeaderView
//{
//    if (_tableHeaderView == nil) {
//        _tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 60)];
//        _tableHeaderView.backgroundColor = [UIColor redColor];
//        [_tableHeaderView addSubview:self.lineView];
//        [_tableHeaderView addSubview:self.tableHeaderLabelOne];
//        [_tableHeaderView addSubview:self.tableHeaderLabelTwo];
//        
//        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(1);
//            make.height.equalTo(_tableHeaderView);
//            make.left.mas_equalTo(_tableHeaderView).offset(20);
//            make.top.mas_equalTo(_tableHeaderView).offset(0);
//        }];
//        
//    }
//    return _tableHeaderView;
//}
//

-(UILabel *)tableHeaderLabelOne
{
    if (_tableHeaderLabelOne == nil) {
        _tableHeaderLabelOne = [[UILabel alloc]init];
        _tableHeaderLabelOne.backgroundColor = [UIColor blackColor];
        _tableHeaderLabelOne.numberOfLines = 2;
        _tableHeaderLabelOne.textAlignment = NSTextAlignmentCenter;
        _tableHeaderLabelOne.layer.cornerRadius = 5;
        _tableHeaderLabelOne.layer.masksToBounds = YES;
        _tableHeaderLabelOne.textColor = [UIColor whiteColor];
        _tableHeaderLabelOne.font = [UIFont systemFontOfSize:10];
    }
    return _tableHeaderLabelOne;
}
-(UILabel *)tableHeaderLabelTwo
{
    if (_tableHeaderLabelTwo == nil) {
        _tableHeaderLabelTwo = [[UILabel alloc]init];
        _tableHeaderLabelTwo.font = [UIFont systemFontOfSize:10];

    }
    return _tableHeaderLabelTwo;
}

-(UIView *)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor blackColor];
    }
    return _lineView;
    
}

@end
