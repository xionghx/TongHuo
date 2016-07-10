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
@interface ArticleListTableViewCell()
@property(nonatomic,strong)UIView *masonryView;
@end


@implementation ArticleListTableViewCell

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    //如果有系统关键字不要慌，两步搞定。手动的映射key值不同的值。
    //    if ([key isEqualToString:@"id"]) {
    //        self.ID = value;
    //    }
    //    NSLog(@"%@=%@",key,value);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self setupLayout];
    }
    return self;
}

-(void)setupLayout
{
    [self.contentView addSubview:self.thumbImage];
    [self.thumbImage  addSubview:self.avatarButton];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.introLabel];
    [self.contentView addSubview:self.assistBar];
    [self.contentView addSubview:self.catenameButton];
    WEAK_SELF;
    
    [weakSelf.thumbImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf);
        make.top.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 200));
    }];
    [weakSelf.avatarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.thumbImage).offset(20);
        make.top.equalTo(weakSelf.thumbImage).offset(20);
        //        make.right.equalTo(weakSelf.thumbImage.mas_right).offset( - 300);
        //        make.bottom.equalTo(weakSelf.thumbImage.mas_bottom).offset(-120);
        //        make.height.mas_equalTo(0);
        //        make.size.mas_equalTo(CGSizeMake(80, 40));
        //        make.size.mas_offset(CGSizeMake(40, 20));
        //        make.width.mas_equalTo(200);
    }];
    [weakSelf.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.thumbImage);
        make.top.equalTo(weakSelf.thumbImage.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 50));
    }];
    [weakSelf.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.thumbImage);
        make.top.equalTo(weakSelf.titleLabel.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W,100));
    }];
    [weakSelf.assistBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.thumbImage);
        make.top.equalTo(weakSelf.introLabel.mas_bottom);
    }];
    [weakSelf.catenameButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-10);
        make.top.equalTo(weakSelf.introLabel.mas_bottom);
    }];
}
-(void)setupWithDataSource:(NSDictionary *)dataSource
       andComplitionHandel:(void(^)(CGFloat a))complitionHandel
{
    [self.contentView addSubview:self.thumbImage];
    [self.thumbImage  addSubview:self.avatarButton];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.introLabel];
    [self.contentView addSubview:self.assistBar];
    [self.contentView addSubview:self.catenameButton];
    [self.contentView addSubview:self.masonryView];
    WEAK_SELF;
    
    
    [self.thumbImage sd_setImageWithURL:[NSURL URLWithString:dataSource[@"sThumb"]]];
    self.titleLabel.text = dataSource[@"sTitle"];
    self.introLabel.text = dataSource[@"sIntro"];
    [self.avatarButton sd_setImageWithURL:[NSURL URLWithString:dataSource[@"sAvatar"]] forState:UIControlStateNormal];
    [self.avatarButton setTitle:dataSource[@"sUsername"] forState:UIControlStateNormal];
    [self.assistBar.comTotalButton setTitle:dataSource[@"sComTotal"] forState:UIControlStateNormal];
    [self.assistBar.zanTotalButton setTitle:dataSource[@"sZanTotal"] forState:UIControlStateNormal];
    [self.catenameButton setTitle:dataSource[@"sCatename"] forState:UIControlStateNormal];
    _dataSources = dataSource;
    
    CGRect titleFrame = [dataSource[@"sTitle"] boundingRectWithSize:CGSizeMake(SCREEN_W-20 , SCREEN_H) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} context:nil];
    
    CGRect introFrame = [dataSource[@"sIntro"] boundingRectWithSize:CGSizeMake(SCREEN_W-20, SCREEN_H) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} context:nil];


    [weakSelf.thumbImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf);
        make.top.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 200));
    }];
    [weakSelf.avatarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.thumbImage).offset(20);
        make.top.equalTo(weakSelf.thumbImage).offset(20);
        //        make.right.equalTo(weakSelf.thumbImage.mas_right).offset( - 300);
        //        make.bottom.equalTo(weakSelf.thumbImage.mas_bottom).offset(-120);
        //        make.height.mas_equalTo(0);
        //        make.size.mas_equalTo(CGSizeMake(80, 40));
        //        make.size.mas_offset(CGSizeMake(40, 20));
        //        make.width.mas_equalTo(200);
    }];
    [weakSelf.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.thumbImage);
        make.top.equalTo(weakSelf.thumbImage.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, titleFrame.size.height));
    }];
    [weakSelf.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.thumbImage);
        make.top.equalTo(weakSelf.titleLabel.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W,introFrame.size.height));
    }];
    [weakSelf.assistBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.thumbImage);
        make.top.equalTo(weakSelf.introLabel.mas_bottom);
    }];
    [weakSelf.catenameButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-10);
        make.bottom.equalTo(weakSelf.assistBar.mas_bottom);
        
    }];
    [weakSelf.masonryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.assistBar.mas_bottom);
    }];

    complitionHandel(self.masonryView.frame.origin.y);

    self.xHeight =  self.masonryView.frame.origin.y ;
//    CGRect frame = [content boundingRectWithSize:CGSizeMake(200, 350) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} context:nil];

}

-(UIView *)masonryView
{
    if (_masonryView == nil) {
        _masonryView =[[UIView alloc]init];
    }
    return _masonryView;
}
-(ArticleAssistButton *)avatarButton
{
    if (_avatarButton == nil) {
        _avatarButton = [ArticleAssistButton buttonWithType:UIButtonTypeCustom];
    }
    return _avatarButton;
}
-(ArticleAssistBar *)assistBar
{
    if (_assistBar == nil) {
        _assistBar = [[ArticleAssistBar alloc]init];
        _assistBar.backgroundColor = [UIColor whiteColor];
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
    }
    return _titleLabel;
}
-(UILabel *)introLabel
{
    if (_introLabel == nil) {
        _introLabel = [[UILabel alloc]init];
        _introLabel.textColor = [UIColor blackColor];
        _introLabel.numberOfLines = 0;
        _introLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _introLabel;
}
-(UIButton *)catenameButton
{
    if (_catenameButton == nil) {
        _catenameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _catenameButton.backgroundColor = [UIColor brownColor];
    }
    return _catenameButton;
}

-(void)setDataSources:(NSDictionary *)dataSources
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
    NSLog(@"%@",_dataSources);
}


@end
