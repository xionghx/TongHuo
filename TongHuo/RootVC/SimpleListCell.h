//
//  ArticleCateListCell.h
//  TongHuo
//
//  Created by xionghuanxin on 7/11/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleListCell : UITableViewCell
-(void)setupDataWitDataSource:(NSDictionary *)dataSource
                withIndexPath:(NSIndexPath *)indexPath
      andShouldShowIntroLabel:(BOOL)showIntroLabel;


@end
