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
//        self.navigationBar.backgroundColor = [UIColor redColor];
        self.navigationBar.barTintColor = [UIColor redColor];
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

-(UISegmentedControl *)segmentedControl
{
    if (_segmentedControl == nil) {
        _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"专栏精选",@"MAMA头条"]];
        _segmentedControl.centerX = 0.5 * SCREEN_W;
    }
    return _segmentedControl;
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
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:nil image:@"打开更多"];
        // 定义rightBarButtonItem
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:nil image:@"calender_F"];

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
