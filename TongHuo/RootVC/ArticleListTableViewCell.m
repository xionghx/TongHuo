//
//  ArticleListTableViewCell.m
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleListTableViewCell.h"

@interface ArticleListTableViewCell()

//@property(nonatomic,strong)UIButton *
@end


@implementation ArticleListTableViewCell
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@",self.sThumb];
}
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
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView addSubview:self.thumbImage];
    [self.thumbImage addSubview:self.avatarImage];
    [self.thumbImage addSubview:self.usernameLabel];
    [self.contentView addSubview:self.introLabel];
    [self.contentView addSubview:self.shareurlButton];
    [self.contentView addSubview:self.collectTotalButton];
    [self.contentView addSubview:self.collectTotalLabel];
    [self.contentView addSubview:self.zanTotalButton];
    [self.contentView addSubview:self.zanTotalLabel];
    [self.contentView addSubview:self.comTotalButton];
    [self.contentView addSubview:self.comTotalLabel];
    [self.contentView addSubview:self.catenameLabel];

}
-(UIImageView *)thumbImage
{
    if (_thumbImage == nil) {
        _thumbImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 100)];
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
        _usernameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImage.x + self.avatarImage.width ,self.avatarImage.y, 50, 20)];
        
    }
    return _usernameLabel;
}
-(UILabel *)introLabel
{
    if (_introLabel == nil) {
        _introLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.thumbImage.y +self.thumbImage.height, SCREEN_W, 200)];
        _introLabel.text = self.sIntro;
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
        _zanTotalLabel = [[UILabel alloc]initWithFrame:CGRectMake(_zanTotalButton.x + _zanTotalButton.width, _zanTotalButton.y, 30, 30)];
        
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
    }
    return _comTotalLabel;
}
-(UILabel *)catenameLabel
{
    if (_comTotalLabel == nil) {
        _comTotalLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_W - 50, self.comTotalLabel.y, 50, 30)];
    }
    return _catenameLabel;
}
@end
