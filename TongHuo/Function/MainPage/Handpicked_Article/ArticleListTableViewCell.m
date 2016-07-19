//
//  ArticleListTableViewCell.m
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleListTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "MJRefresh.h"
@interface ArticleListTableViewCell()
@property(nonatomic,strong)UIView *masonryView;
@end


@implementation ArticleListTableViewCell

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    //手动的映射key值不同的值。
    //    if ([key isEqualToString:@"id"]) {
    //        self.ID = value;
    //    }
    //    NSLog(@"%@=%@",key,value);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}


-(void)setupUI
{
    [self.thumbImage  addSubview:self.avatarButton];
    [self.contentView addSubview:self.thumbImage];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.introLabel];
    [self.contentView addSubview:self.assistBar];
    [self.contentView addSubview:self.catenameButton];
    [self.contentView addSubview:self.masonryView];
    [self.thumbImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 200));
    }];
    
    [self.avatarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.thumbImage).offset(20);
        make.top.equalTo(self.thumbImage).offset(20);
        make.size.mas_offset(CGSizeMake(100, 30));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.thumbImage).offset(30);
        make.top.equalTo(self.thumbImage.mas_bottom).offset(20);
        make.right.equalTo(self.thumbImage.mas_right).offset( - 30);
    }];
    
    [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.thumbImage).offset(20);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
        make.right.equalTo(self.thumbImage.mas_right).offset( - 20);
        
    }];
    
    [self.assistBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.thumbImage.mas_left);
        make.top.equalTo(self.introLabel.mas_bottom).offset(25);
        make.width.equalTo(@100);
        make.height.equalTo(@20);
        
    }];
    
    [self.catenameButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.bottom.equalTo(self.assistBar.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(40, 20));
        
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.thumbImage);
        make.bottom.equalTo(self.assistBar).offset(30);
    }];

}



-(ArticleAssistButton *)avatarButton
{
    if (_avatarButton == nil) {
        _avatarButton = [ArticleAssistButton buttonWithType:UIButtonTypeCustom];
        _avatarButton.titleLabel.font = [UIFont systemFontOfSize:11];
        _avatarButton.tag = 201;
        _avatarButton.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _avatarButton.imageView.layer.borderWidth = 1.5;
        [_avatarButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];


    }
    return _avatarButton;
}
-(ArticleAssistBar *)assistBar
{
    if (_assistBar == nil) {
        _assistBar = [[ArticleAssistBar alloc]init];
        _assistBar.shareurlButton.tag = 202;
        _assistBar.collectTotalButton.tag = 203;
        _assistBar.zanTotalButton.tag = 204;
        _assistBar.comTotalButton.tag = 205;
        [_assistBar.shareurlButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_assistBar.collectTotalButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_assistBar.zanTotalButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_assistBar.comTotalButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _assistBar;
}
-(UIImageView *)thumbImage
{
    if (_thumbImage == nil) {
        _thumbImage = [[UIImageView alloc]init];
        _thumbImage.backgroundColor = [UIColor redColor];
    }
    return _thumbImage;
}
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:20];

    }
    return _titleLabel;
}
-(UILabel *)introLabel
{
    if (_introLabel == nil) {
        _introLabel = [[UILabel alloc]init];
        _introLabel.textColor = [UIColor blackColor];
        _introLabel.numberOfLines = 0;
        _introLabel.textAlignment = NSTextAlignmentLeft;
        _introLabel.font = [UIFont systemFontOfSize:12];
        _introLabel.textColor = [UIColor grayColor];
    }
    return _introLabel;
}
-(UIButton *)catenameButton
{
    if (_catenameButton == nil) {
        _catenameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _catenameButton.backgroundColor = MainColor;
        _catenameButton.titleLabel.font = [UIFont systemFontOfSize:11];
        _catenameButton.tag = 206;
        [_catenameButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _catenameButton;
}

-(void)setupValueWith:(NSDictionary *)dataSources
{
    [self.thumbImage sd_setImageWithURL:[NSURL URLWithString:dataSources[@"sThumb"]]];
    self.titleLabel.text = dataSources[@"sTitle"];
    self.introLabel.text = dataSources[@"sIntro"];
    [self.avatarButton sd_setImageWithURL:[NSURL URLWithString:dataSources[@"sAvatar"]] forState:UIControlStateNormal];
    [self.avatarButton setTitle:dataSources[@"sUsername"] forState:UIControlStateNormal];
    [self.assistBar.comTotalButton setTitle:dataSources[@"sComTotal"] forState:UIControlStateNormal];
    [self.assistBar.zanTotalButton setTitle:dataSources[@"sZanTotal"] forState:UIControlStateNormal];
    [self.catenameButton setTitle:dataSources[@"sCatename"] forState:UIControlStateNormal];
    _dataSources = dataSources;
}


-(void)buttonAction:(UIButton *)sender
{
    
    NSLog(@"%ld",sender.tag);
    switch (sender.tag - 200) {
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
            
        default:
            break;
    }
}

@end
