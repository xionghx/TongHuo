//
//  ArticleListTableViewCell.m
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleListTableViewCell.h"
#import "Masonry.h"

@interface ArticleListTableViewCell()

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
        [self setupLayout];
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
        make.right.equalTo(weakSelf).offset(10);
        make.top.equalTo(weakSelf.introLabel.mas_bottom);
    }];
}
-(void)layoutSubviews
{
    //    [super layoutSubviews];
    //    [self.contentView addSubview:self.shareurlButton];
    //    [self.contentView addSubview:self.collectTotalButton];
    //    [self.contentView addSubview:self.collectTotalLabel];
    //    [self.contentView addSubview:self.zanTotalButton];
    //    [self.contentView addSubview:self.zanTotalLabel];
    //    [self.contentView addSubview:self.comTotalButton];
    //    [self.contentView addSubview:self.comTotalLabel];
    
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
        _thumbImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
        _thumbImage.backgroundColor = [UIColor redColor];
    }
    return _thumbImage;
}
-(UIImageView *)avatarImage
{
    if (_avatarImage == nil) {
        _avatarImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    }
    return _avatarImage;
}
-(UILabel *)usernameLabel
{
    if (_usernameLabel == nil) {
        _usernameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImage.x + self.avatarImage.width ,self.avatarImage.y, 120, 20)];
        
    }
    return _usernameLabel;
}
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.thumbImage.y + self.thumbImage.height, SCREEN_W, 100)];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UILabel *)introLabel
{
    if (_introLabel == nil) {
        _introLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.titleLabel.y +self.titleLabel.height, SCREEN_W, 100)];
        _introLabel.textColor = [UIColor blackColor];
        _introLabel.numberOfLines = 0;
        _introLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _introLabel;
}
-(UIButton *)shareurlButton
{
    if (_shareurlButton == nil) {
        _shareurlButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareurlButton.frame = CGRectMake(10 , self.introLabel.y + self.introLabel.height, 30, 30) ;
        _shareurlButton.backgroundColor = [UIColor redColor];
    }
    return _shareurlButton;
}
-(UIButton *)collectTotalButton
{
    if (_collectTotalButton == nil) {
        _collectTotalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _collectTotalButton.frame = CGRectMake(self.shareurlButton.x + self.shareurlButton.width, self.shareurlButton.y, 20, 20);
        
    }
    return _collectTotalButton;
}
-(UILabel *)collectTotalLabel
{
    if (_collectTotalLabel == nil) {
        _collectTotalLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.collectTotalButton.x + self.collectTotalButton.width, self.collectTotalButton.y, 30, 30)];
        _collectTotalLabel.backgroundColor = [UIColor blueColor];
    }
    return _collectTotalLabel;
}
-(UIButton *)zanTotalButton
{
    if (_zanTotalButton == nil) {
        _zanTotalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _zanTotalButton.frame = CGRectMake(self.collectTotalLabel.x + self.collectTotalLabel.width, self.collectTotalLabel.y, 30, 30);
    }
    return _zanTotalButton;
}
-(UILabel *)zanTotalLabel
{
    if (_zanTotalLabel == nil) {
        _zanTotalLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.zanTotalButton.x + self.zanTotalButton.width, self.zanTotalButton.y, 30, 30)];
        _zanTotalLabel.backgroundColor = [UIColor lightTextColor];
    }
    return _zanTotalLabel;
}
-(UIButton *)comTotalButton
{
    if (_comTotalButton == nil) {
        _comTotalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _comTotalButton.frame = CGRectMake(self.zanTotalLabel.x + self.zanTotalLabel.width, _zanTotalLabel.y, 30, 30);
    }
    return _comTotalButton;
}
-(UILabel *)comTotalLabel
{
    if (_comTotalLabel == nil) {
        _comTotalLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.comTotalButton.x + self.comTotalButton.width, self.comTotalButton.y, 30, 30)];
        _comTotalLabel.backgroundColor = [UIColor brownColor];
    }
    return _comTotalLabel;
}
//-(UILabel *)catenameLabel
//{
//    if (_comTotalLabel == nil) {
//        _comTotalLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_W - 50, self.comTotalLabel.y, 50, 30)];
//    }
//    return _catenameLabel;
//}
@end
