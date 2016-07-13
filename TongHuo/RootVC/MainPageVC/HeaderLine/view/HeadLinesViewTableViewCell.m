//
//  HeadLinesViewTableViewCell.m
//  童伙妈妈
//
//  Created by LuSW on 16/7/10.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "HeadLinesViewTableViewCell.h"
#import "Masonry.h"

@interface HeadLinesViewTableViewCell ()

/** 文章标题*/
@property (nonatomic,strong)UILabel         *titleLabel;
/** 时间*/
@property (nonatomic,strong)UILabel         *timeLabel;
/** 文章内容介绍*/
@property (nonatomic,strong)UILabel         *introLabel;
/** 原文链接按钮*/
@property (nonatomic,strong)UIButton        *linkButton;

/** 竖线*/
@property (nonatomic,strong)UIView          *lineView;
/** 圆点*/
@property (nonatomic,strong)UIView          *squreView;


@end

@implementation HeadLinesViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initializeInterface];
    }
    return self;
}

- (void)initializeInterface {
    self.layer.masksToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left).with.offset(30);
        make.width.equalTo(@1);
    }];
    
    [self.contentView addSubview:self.squreView];
    [_squreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView.mas_top).with.offset(25);
        make.centerX.equalTo(_lineView.mas_centerX);
        make.height.equalTo(@6);
        make.width.equalTo(@6);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineView.mas_left).offset(15);
        make.top.equalTo(@15);
        make.right.equalTo(@(-20));
    }];
    
    [self.contentView addSubview:self.timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(5);
        make.right.equalTo(@(-15));
    }];
    
    [self.contentView addSubview:self.introLabel];
    [_introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_timeLabel.mas_bottom).with.offset(10);
        make.left.equalTo(_titleLabel);
        make.right.equalTo(self).with.offset(-10);
    }];
    
    [self.contentView addSubview:self.linkButton];
    [_linkButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_introLabel.mas_right).with.offset(-20);
        make.top.equalTo(_introLabel.mas_bottom).with.offset(10);
    }];
}

#pragma mark - Action
- (void)linkButtonAction {

}


#pragma mark - Getter

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = ({
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.font = [UIFont systemFontOfSize:15];
            label.textAlignment = NSTextAlignmentLeft;
            label.numberOfLines = 2;
            label;
        });
    }
    return _titleLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = ({
            UILabel * label = [[UILabel alloc] init ];
            label.font = [UIFont systemFontOfSize:11 weight:UIFontWeightThin];
            label.textColor = [UIColor lightGrayColor];
            label;
        });
    }
    return _timeLabel;
}

- (UILabel *)introLabel {
    if (_introLabel == nil) {
        _introLabel = ({
            UILabel * label = [[UILabel alloc] init ];
            label.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
            label.textColor = [UIColor darkGrayColor];
            label.numberOfLines = 0;
            label;
        });
    }
    return _introLabel;
}

- (UIButton *)linkButton
{
    if (_linkButton == nil) {
        _linkButton = ({
            UIButton * button = [[UIButton alloc] init];
            [button setTitle:@"[原文连接]" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
            [button addTarget:self action:@selector(linkButtonAction) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
        
    }
    return _linkButton;
}

- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = ({
            UIView * line = [[UIView alloc] init];
            line.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
            line;
        });
    }
    return _lineView;
}

- (UIView *)squreView {
    if (_squreView == nil) {
        _squreView = ({
            UIView * squre = [[UIView alloc] init];
            squre.backgroundColor = [UIColor blackColor];
            squre.layer.cornerRadius = 3.0;
            squre.layer.borderWidth = 0.5;
            squre.layer.borderColor = [UIColor whiteColor].CGColor;
            squre;
        });
    }
    return _squreView;
}

#pragma mark - Setter
- (void)setModel:(HeadLinesModel *)model {
    _model = model;
    _titleLabel.text = _model.sTitle;
    _timeLabel.text = _model.sAddtime;
    _introLabel.text = _model.sIntro;
    
    [self layoutIfNeeded];

    if (_model.selected) {
        _introLabel.hidden = _linkButton.hidden = NO;
        _model.cellHeight = CGRectGetHeight(_titleLabel.bounds) + CGRectGetHeight(_introLabel.bounds) +CGRectGetHeight(_timeLabel.bounds)+CGRectGetHeight(_linkButton.bounds)+ 50;

    }else {
        _introLabel.hidden = _linkButton.hidden = YES;
        _model.cellHeight = CGRectGetHeight(_titleLabel.bounds) + CGRectGetHeight(_timeLabel.bounds)+30;
    }
    
    
    
    
}






@end


















