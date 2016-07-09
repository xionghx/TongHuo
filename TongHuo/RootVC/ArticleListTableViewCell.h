//
//  ArticleListTableViewCell.h
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleListTableViewCell : UITableViewCell
@property(nonatomic,strong)NSString *sThumb;
@property(nonatomic,strong)NSString *sAvatar;
@property(nonatomic,strong)NSString *sUsername;
@property(nonatomic,strong)NSString *sIntro;
@property(nonatomic,strong)NSString *sShareurl;
@property(nonatomic,strong)NSString *sCollectTotal;
//@property(nonatomic,strong)NSString *sCollectTotalLabel;
@property(nonatomic,strong)NSString *sZanTotal;
//@property(nonatomic,strong)NSString *sZanTotalLabel;
@property(nonatomic,strong)NSString *sComTotal;
//@property(nonatomic,strong)NSString *sComTotalLabel;
@property(nonatomic,strong)NSString *sCatename;
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

-(NSString *)description;




@property(nonatomic,strong)UIImageView * thumbImage;
@property(nonatomic,strong)UIImageView *avatarImage;
@property(nonatomic,strong)UILabel *usernameLabel;
@property(nonatomic,strong)UILabel *introLabel;
@property(nonatomic,strong)UIButton *shareurlButton;
@property(nonatomic,strong)UIButton *collectTotalButton;
@property(nonatomic,strong)UILabel *collectTotalLabel;
@property(nonatomic,strong)UIButton *zanTotalButton;
@property(nonatomic,strong)UILabel *zanTotalLabel;
@property(nonatomic,strong)UIButton *comTotalButton;
@property(nonatomic,strong)UILabel *comTotalLabel;
@property(nonatomic,strong)UILabel *catenameLabel;

@end
