//
//  LeftSideView.h
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "RootVC.h"
@protocol LeftSideViewDelegate <NSObject>
//-(void)

@end

@interface LeftSideView : UIView
@property(nonatomic,strong)id<LeftSideViewDelegate> delegate;
@property(nonatomic,strong)id rootVC;
@property(nonatomic,strong)UITableView * tableView;
-(void)loadDataSource;

@end
