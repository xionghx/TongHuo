//
//  ArticleListTableViewCell.h
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleAssistBar.h"
#import "ArticleAssistButton.h"

@interface ArticleListTableViewCell : UITableViewCell
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
-(void)setupValueWith:(NSDictionary *)dataSources;
@property(nonatomic,strong)UIImageView * thumbImage;
@property(nonatomic,strong)ArticleAssistButton *avatarButton;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *introLabel;
@property(nonatomic,strong)UIButton *shareurlButton;
@property(nonatomic,strong)UIButton *collectTotalButton;
@property(nonatomic,strong)UIButton *zanTotalButton;
@property(nonatomic,strong)ArticleAssistBar * assistBar;
@property(nonatomic,strong)UIButton *catenameButton;
@property(nonatomic,strong)NSDictionary * dataSources;

@end
