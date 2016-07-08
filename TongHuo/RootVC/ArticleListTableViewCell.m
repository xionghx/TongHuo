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
        _sAvatarImage = [UIImageView alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    }
}

@end
