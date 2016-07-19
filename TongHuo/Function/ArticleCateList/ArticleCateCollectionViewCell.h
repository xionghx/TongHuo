//
//  ArticleCateCollectionViewCell.h
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleCateCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView *sCimgView;
@property(nonatomic,strong)UILabel *sCnameLabel;
-(void)setupDataWithDataSource:(NSDictionary *)dataSource;

@end
