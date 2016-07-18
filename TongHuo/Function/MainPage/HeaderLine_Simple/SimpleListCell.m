//
//  ArticleCateListCell.m
//  TongHuo
//
//  Created by xionghuanxin on 7/11/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "SimpleListCell.h"
#import "Masonry.h"
@interface SimpleListCell ()
@property(nonatomic,strong)UIView * lineView;
@property(nonatomic,strong)UIView * squreView;

@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * timeLabel;
@property(nonatomic,strong)UILabel *introLabel;

@property(nonatomic,strong)UIButton *linkButton;


@end

@implementation SimpleListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupLayout];
    }
    return self;
}
-(void)setupLayout
{
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.squreView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.introLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.linkButton];
    
    
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.height.equalTo(self);
        make.left.mas_equalTo(self).offset(20);
        make.top.mas_equalTo(self).offset(0);
        
    }];
    
    [_squreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(6);
        make.height.equalTo(self.squreView.mas_width);
        make.centerX.mas_equalTo(self.lineView);
        make.centerY.mas_equalTo(_titleLabel);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(_squreView.mas_right).offset(5);
        make.right.mas_equalTo(self).offset(-5);
        
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(_squreView.mas_right).offset(5);
        make.right.mas_equalTo(self).offset(-5);
    }];
    
    [_introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_timeLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(_lineView.mas_right).offset(5);
        make.right.mas_equalTo(self).offset(-10);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel);
        
        make.bottom.mas_equalTo(_introLabel).offset(20);
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
        _titleLabel.font = [UIFont systemFontOfSize:15];

        
    }
    return _titleLabel;
}
-(UILabel *)timeLabel
{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:11];
        _timeLabel.textColor = [UIColor darkGrayColor];
        _timeLabel.numberOfLines = 0;
    }
    return _timeLabel;
}
-(UILabel *)introLabel
{
    if (_introLabel == nil) {
        _introLabel = [[UILabel alloc]init];
        _introLabel.numberOfLines = 0;
        _introLabel.font = [UIFont systemFontOfSize:12];
        
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
//-(void)setupDataWitDataSource:(NSDictionary *)dataSource
//                withIndexPath:(NSIndexPath *)indexPath
//      andShouldShowIntroLabel:(BOOL)showIntroLabel
//{
//    //    NSLog(@"%@",dataSource);
//    //    self.showIntroLabel = indexPath == self.currentSelectedPath && self.currentSelectedPath != self.lastSelectedPath? YES:NO;
//    //    if (_lastSelectedPath == _currentSelectedPath) {
//    //        self.showIntroLabel = !self.showIntroLabel;
//    //    }
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[dataSource[@"sAddtime"] doubleValue]];
//    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
//    NSString * string = [formatter stringFromDate:date];
//    self.timeLabel.text = string;
//    self.titleLabel.text = dataSource[@"sTitle"];
//    self.introLabel.text = showIntroLabel? dataSource[@"sIntro"]:nil;
//}

-(void)setupDataWithDataSource:(NSDictionary *)dataSource
                 withIndexPath:(NSIndexPath *)indexPath
   andShouldShowIntroLabelPath:(NSIndexPath *)path
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[dataSource[@"sAddtime"] doubleValue]];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString * string = [formatter stringFromDate:date];
    self.timeLabel.text = string;
    self.titleLabel.text = dataSource[@"sTitle"];
    self.introLabel.text = indexPath == path? dataSource[@"sIntro"]:nil;
    
    self.titleLabel.textColor = indexPath == path? MainColor :[UIColor blackColor];
    self.squreView.backgroundColor = indexPath == path? MainColor:[UIColor blackColor];

}

-(void)haveBeenSelectedMethod:(BOOL)showIntroLabel

{
    //    self.showIntroLabel = selectedIndexPath ==_lastSelectedPath? !self.showIntroLabel : YES;
//    self.showIntroLabel = showIntroLabel;
//    NSLog(@"%d",self.showIntroLabel);
    
}


@end
