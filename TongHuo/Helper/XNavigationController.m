     #import <UIKit/UIKit.h>
//
//  XNavigationController.m
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "XNavigationController.h"


@interface XNavigationController ()
@property(nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong)UIBarButtonItem     *item;

@end

@implementation XNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
//        [self.navigationBar setValue:0 forKey:@"barPosition"];
//        self.navigationBar.barPosition = UIBarPositionTopAttached;
        self.navigationBar.backgroundColor = [UIColor blackColor];
        self.navigationBar.barTintColor = [UIColor blackColor];
//        [self.navigationBar addSubview:self.segmentedControl];
//        [self.navigationBar addSubview:self.pageControl];
    };
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.frame = CGRectMake(0, 0, SCREEN_W, 20);
//    [self.view setValue:CGRectMake(0, 0, SCREEN_W, 20) forKey:@"frame"];
}

-(UIButton *)titleViewLeftButton
{
    if (_titleViewLeftButton == nil) {
        _titleViewLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _titleViewLeftButton.frame = CGRectMake(0, 0, 100, 41);
    }
    return _titleViewLeftButton;
}
-(UIButton *)titleViewRightButton
{
    if (_titleViewRightButton == nil) {
        _titleViewRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _titleViewRightButton.frame = CGRectMake(100, 0, 100, 41);
    }
    return _titleViewRightButton;
}
-(UIView *)animationLine
{
    if (_animationLine == nil) {
        _animationLine = [[UIView alloc]initWithFrame:CGRectMake(0, 41, 100, 3)];
        _animationLine.backgroundColor = [UIColor whiteColor];
    }
    return _animationLine;
}
-(UIView *)titleView
{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
        _titleView.centerX = 0.5* SCREEN_W;
        _titleView.centerY = 42;
        _titleView.backgroundColor = [UIColor blackColor];
    }
    return  _titleView;
}

-(UISegmentedControl *)segmentedControl
{
    if (_segmentedControl == nil) {
        _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"专栏精选",@"MAMA头条"]];
        _segmentedControl.centerX = 0.5 * SCREEN_W;
    }
    return _segmentedControl;
}
-(UIButton *)leftButton
{
    if (_leftButton == nil) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(SCREEN_W - 60, 20, 44, 44);
        _leftButton.imageEdgeInsets = UIEdgeInsetsMake(8, 13, 18, 13);

    }
    return _leftButton;
}
-(UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.frame = CGRectMake(100, 20, 100, 10);
        _pageControl.numberOfPages = 2;
        
    }
    return _pageControl;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count<1) {
//        viewController.hidesBottomBarWhenPushed = YES;
        
        // 定义leftBarButtonItem
        viewController.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:viewController action:nil image:@"打开更多"imageInset:UIEdgeInsetsMake(30, 10, 30, 50)];
        // 定义rightBarButtonItem
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:viewController action:nil image:@"calender_F" imageInset:UIEdgeInsetsMake(40, 100, 45, -10)];
        [self.view addSubview:self.titleView];
        [self.view bringSubviewToFront:self.titleView];
        [self.titleView addSubview:self.animationLine];
        [self.titleView addSubview: self.titleViewLeftButton];
        [self.titleView addSubview:self.titleViewRightButton];
        [self.titleViewLeftButton setTitle:@"专栏精选" forState:UIControlStateNormal];
        [self.titleViewLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self.titleViewLeftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.titleViewRightButton setTitle:@"MAMA头条" forState:UIControlStateNormal];
        [self.titleViewRightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self.titleViewRightButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];


    }
    // 调用父类pushViewController，self.viewControllers数组添加对象viewController
    [super pushViewController:viewController animated:animated];
    
}
//-(void)setBarButtonItem{
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTargat:self action:@selector(back) image:@"" highImage:@""];
//
//}

- (void)back
{
    // 这里要用self，不能用self.navigationViewController，因为self本身就是导航控制器对象，self.navigationViewController是nil
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}



- (void)test {
    
    
}











@end
