//
//  ArticleList_CatePageCell.h
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleList_CatePageCell : UITableViewCell
@property(nonatomic,strong)UIImageView *sThumbImageView;
@property(nonatomic,strong)UILabel *sCatenameLabel;
@property(nonatomic,strong)UILabel *sTitleLabel;
@property(nonatomic,strong)UILabel *sHitnumLabel;

-(void)setupDataWitDataSource:(NSDictionary *)dataSource;

@end
