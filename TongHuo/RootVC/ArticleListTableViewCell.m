//
//  ArticleListTableViewCell.m
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleListTableViewCell.h"

@interface ArticleListTableViewCell()
@property(nonatomic,strong)UIImageView * sThumbImage;
@property(nonatomic,strong)UIImageView *sAvatarImage;
@property(nonatomic,strong)UILabel *sUsernameLabel;
@property(nonatomic,strong)UILabel *sIntroLabel;
@property(nonatomic,strong)UIButton *sShareurlButton;
@property(nonatomic,strong)UIButton *sCollectTotalButton;
@property(nonatomic,strong)UILabel *sCollectTotalLabel;
@property(nonatomic,strong)UIButton *sZanTotalButton;
@property(nonatomic,strong)UILabel *sZanTotalLabel;
@property(nonatomic,strong)UIButton *sComTotalButton;
@property(nonatomic,strong)UILabel *sComTotalLabel;
@property(nonatomic,strong)UILabel *sCatenameLabel;

//@property(nonatomic,strong)UIButton *
@end


@implementation ArticleListTableViewCell


-(UIImageView *)sThumbImage
{
    if (_sThumbImage == nil) {
        _sThumbImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 100)];
        
    }
    return _sThumbImage;
}
-(UIImageView *)sAvatarImage
{
    if (_sAvatarImage == nil) {
        _sAvatarImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    }
    return _sAvatarImage;
}
-(UILabel *)sUsernameLabel
{
    if (_sUsernameLabel == nil) {
        _sUsernameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.sAvatarImage.x + self.sAvatarImage.width ,self.sAvatarImage.y, 50, 20)];
    }
    return _sUsernameLabel;
}
-(UILabel *)sIntroLabel
{
    if (_sIntroLabel == nil) {
        _sIntroLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.sThumbImage.y +self.sThumbImage.height, SCREEN_W, 200)];
        
    }
    return _sIntroLabel;
}
-(UIButton *)sShareurlButton
{
    if (_sShareurlButton == nil) {
        _sShareurlButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sShareurlButton.frame = CGRectMake(10 , self.sIntroLabel.y + self.sIntroLabel.height, 30, 30) ;
    }
    return _sShareurlButton;
}
-(UIButton *)sCollectTotalButton
{
    if (_sCollectTotalButton == nil) {
        _sCollectTotalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sCollectTotalButton.frame = CGRectMake(self.sShareurlButton.x + self.sShareurlButton.width, self.sShareurlButton.y, 20, 20);
        
    }
    return _sCollectTotalButton;
}
-(UILabel *)sCollectTotalLabel
{
    if (_sCollectTotalLabel == nil) {
        _sCollectTotalLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.sCollectTotalButton.x + self.sCollectTotalButton.width, self.sCollectTotalButton.y, 30, 30)];
    }
    return _sCollectTotalLabel;
}

@end
