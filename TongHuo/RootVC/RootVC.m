//
//  RootVC.m
//  TongHuo
//
//  Created by xionghuanxin on 7/7/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "RootVC.h"
#import "MainPageVC.h"
#import "LeftSideView.h"
#import "ShadowView.h"
#import "XNavigationController.h"

@interface RootVC ()<UIScrollViewDelegate,UITableViewDelegate>
@property(nonatomic,strong)XNavigationController * mainPage;
@property(nonatomic,strong)LeftSideView * leftSide;
@property(nonatomic,strong)ShadowView * shadowView;
@property(nonatomic,strong)UIScrollView *scrollView;


@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self interfaceInital];
}
-(void)interfaceInital
{
    self.view.backgroundColor = [UIColor yellowColor];
    [self.navigationItem.rightBarButtonItem setAction:@selector(rightItemTaped)];
    [self.navigationItem.leftBarButtonItem setAction:@selector(leftItemTaped)];
    [self.view addSubview:self.scrollView];


//    [self addChildViewController:self.mainPage];
//    [self.mainPage didMoveToParentViewController:self];
//    [self.view addSubview:self.mainPage.view];
    [((XNavigationController *)(self.navigationController)).titleViewLeftButton addTarget:self action:@selector(titleViewLeftButtonTaped) forControlEvents:UIControlEventTouchUpInside];
    [((XNavigationController *)(self.navigationController)).titleViewRightButton addTarget:self action:@selector(titleViewRightButtonTaped) forControlEvents:UIControlEventTouchUpInside];

}
-(XNavigationController *)mainPage
{
    if (_mainPage == nil) {
        MainPageVC * mainVC = [MainPageVC new];
        mainVC.rootVC = self;
        _mainPage = [[XNavigationController alloc]initWithRootViewController:mainVC];
    }
    return _mainPage;
}
-(UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64)];
        _scrollView.pagingEnabled = true;
        _scrollView.bounces = false;
        _scrollView.contentSize = CGSizeMake(2 * SCREEN_W, 0);
        _scrollView.backgroundColor = [UIColor grayColor];
        _scrollView.delegate = self;
    }
    return _scrollView;
}

-(ShadowView *)shadowView
{
    if (_shadowView == nil) {
        _shadowView = [[ShadowView alloc]init];
        _shadowView.alpha = 0;
    }
    return _shadowView;
}
-(LeftSideView *)leftSide
{
    if (_leftSide == nil) {
        _leftSide  = [[LeftSideView alloc]init];
        _leftSide.x =-0.5 * SCREEN_W;
        _leftSide.tableView.delegate = self;
    }
    return _leftSide;
}

-(void)rightItemTaped
{
//    [self.navigationController pushViewController:self.mainPage animated:YES];
}

-(void)leftItemTaped
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.shadowView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.leftSide];
//    [self.view addSubview:self.shadowView];
//    [self.view addSubview:self.leftSide];
    [UIView animateWithDuration:0.2 animations:^{
        self.leftSide.x = 0;
        self.shadowView.alpha = 0.3;
    } completion:^(BOOL finished) {
        
        UITapGestureRecognizer * shadowGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftSideHide)];
        [self.shadowView addGestureRecognizer:shadowGesture];
        
    }];
}

-(void)leftSideHide
{
    [UIView animateWithDuration:0.2 animations:^{
        self.shadowView.alpha = 0;
        self.leftSide.x = -0.5 * SCREEN_W;
    } completion:^(BOOL finished) {
        [self.shadowView removeFromSuperview];
    }];
    
}

-(void)titleViewLeftButtonTaped
{
    [UIView animateWithDuration:0.2 animations:^{
        ((XNavigationController *)(self.navigationController)).animationLine.x = 0;
        self.scrollView.contentOffset= CGPointMake(0, self.scrollView.contentOffset.y);
    } completion:^(BOOL finished) {
        ((XNavigationController *)(self.navigationController)).titleViewRightButton.selected = NO;
        ((XNavigationController *)(self.navigationController)).titleViewLeftButton.selected = YES;
        
    }];
    
}


-(void)titleViewRightButtonTaped
{
    [UIView animateWithDuration:0.2 animations:^{
        ((XNavigationController *)(self.navigationController)).animationLine.x = 100;
        self.scrollView.contentOffset= CGPointMake(SCREEN_W, self.scrollView.contentOffset.y);
    } completion:^(BOOL finished) {
        ((XNavigationController *)(self.navigationController)).titleViewRightButton.selected = YES;
        ((XNavigationController *)(self.navigationController)).titleViewLeftButton.selected = NO;
    }];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    ((XNavigationController *)(self.navigationController)).animationLine.x = 100*scrollView.contentOffset.x/SCREEN_W;
    if (scrollView.contentOffset.x > 0.5 * SCREEN_W) {
        ((XNavigationController *)(self.navigationController)).titleViewRightButton.selected = YES;
        ((XNavigationController *)(self.navigationController)).titleViewLeftButton.selected = NO;
        
    }else{
        ((XNavigationController *)(self.navigationController)).titleViewRightButton.selected = NO;
        ((XNavigationController *)(self.navigationController)).titleViewLeftButton.selected = YES;
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
















