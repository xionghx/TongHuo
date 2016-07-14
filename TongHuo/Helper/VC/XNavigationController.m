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
//        self.navigationBar.backgroundColor = [UIColor blackColor];
        self.navigationBar.barTintColor = [UIColor blackColor];
        self.hidesBottomBarWhenPushed = YES;
    };
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
        _animationLine.backgroundColor = MainColor;
    }
    return _animationLine;
}
-(UIView *)titleView
{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
        _titleView.centerX = 0.5* SCREEN_W;
        _titleView.centerY = 42;
    }
    return  _titleView;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count<1) {
        
        // 定义leftBarButtonItem
//        viewController.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:viewController action:nil image:@"打开更多"imageInset:UIEdgeInsetsMake(40, 10, 35, 65)];
        // 定义rightBarButtonItem
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:viewController action:nil image:@"calender_F" imageInset:UIEdgeInsetsMake(52, 112, 45, -5)];
        [self.view addSubview:self.titleView];
//        [[UIApplication sharedApplication].keyWindow addSubview:self.titleView];

//        [viewController.view bringSubviewToFront:self.titleView];
        [self.titleView addSubview:self.animationLine];
        [self.titleView addSubview: self.titleViewLeftButton];
        [self.titleView addSubview:self.titleViewRightButton];
        self.titleViewLeftButton.selected = true;
        [self.titleViewLeftButton setTitle:@"专栏精选" forState:UIControlStateNormal];
        self.titleViewLeftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleViewRightButton.titleLabel.font = [UIFont systemFontOfSize:14];

        [self.titleViewLeftButton setTitleColor:MainColor forState:UIControlStateSelected];
        [self.titleViewLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.titleViewRightButton setTitle:@"MAMA头条" forState:UIControlStateNormal];
        [self.titleViewRightButton setTitleColor:MainColor forState:UIControlStateSelected];
        [self.titleViewRightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];


    }else{
//        viewController.hidesBottomBarWhenPushed = YES;
//        viewController.navigationController.view.hidden =YES;
//        self.view.hidden = YES;
        [self.titleView removeFromSuperview];
//        viewController.navigationItem = nil;
//        [viewController setValue:nil forKey:@"navigationItem"];
        viewController.navigationController.navigationBar.backItem.hidesBackButton = YES;
//        viewController.navigationItem.leftBarButtonItem =[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"黑色返回"imageInset:UIEdgeInsetsMake(40, 10, 35, 65)];
//        viewController.navigationItem.leftBarButtonItem
        self.navigationBarHidden = YES;

    }
    // 调用父类pushViewController，self.viewControllers数组添加对象viewController

    [super pushViewController:viewController animated:animated];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (self.viewControllers.count==2) {
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:nil image:@"打开更多"imageInset:UIEdgeInsetsMake(40, 10, 35, 65)];
        // 定义rightBarButtonItem
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:nil image:@"calender_F" imageInset:UIEdgeInsetsMake(52, 112, 45, -5)];
        self.navigationBarHidden = NO;
        [self.view addSubview:self.titleView];
    };
    return [super popViewControllerAnimated:animated];;
}

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
