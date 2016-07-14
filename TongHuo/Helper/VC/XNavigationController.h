//
//  XNavigationController.h
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XNavigationController : UINavigationController
//@property(nonatomic,strong)UISegmentedControl *segmentedControl;
@property(nonatomic,strong)UIButton * leftButton;
@property(nonatomic,strong)UIButton * rightButton;
@property(nonatomic,strong)UIView *animationLine;
@property(nonatomic,strong)UIView *titleView;
@property(nonatomic,strong)UIButton *titleViewLeftButton;
@property(nonatomic,strong)UIButton *titleViewRightButton;

@end
