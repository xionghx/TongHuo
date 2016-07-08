
//  MainPageVC.m
//  TongHuo
//
//  Created by xionghuanxin on 7/7/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "MainPageVC.h"
#import "LeftSideView.h"
#import "ShadowView.h"
#import "XNavigationController.h"

@interface MainPageVC()<UIScrollViewDelegate>
@property(nonatomic,strong)LeftSideView * leftSide;
@property(nonatomic,strong)ShadowView * shadowView;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *animationLine;
@property(nonatomic,strong)UIView *titleView;

@end

@implementation MainPageVC

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
    NSLog(@"%@",self.navigationController);
    [((XNavigationController *)(self.navigationController)).titleViewLeftButton addTarget:self action:@selector(titleViewLeftButtonTaped) forControlEvents:UIControlEventTouchUpInside];
    [((XNavigationController *)(self.navigationController)).titleViewRightButton addTarget:self action:@selector(titleViewRightButtonTaped) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:self.titleView];
    //    [self.view bringSubviewToFront:self.titleView];
    //    [self.titleView addSubview:self.animationLine];
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
    }
    return _leftSide;
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
-(void)rightItemTaped
{
}

-(void)leftItemTaped
{
    [self.view addSubview:self.shadowView];
    [self.rootVC.view addSubview:self.leftSide];
    [UIView animateWithDuration:0.2 animations:^{
        self.leftSide.x = 0;
        self.shadowView.alpha = 0.3;
    } completion:^(BOOL finished) {
        
        UITapGestureRecognizer * shadowGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shadowHide)];
        [self.shadowView addGestureRecognizer:shadowGesture];
        
    }];
}

-(void)shadowHide
{
    [UIView animateWithDuration:0.2 animations:^{
        self.shadowView.alpha = 0;
        self.leftSide.x = -0.5 * SCREEN_W;
    } completion:^(BOOL finished) {
        [self.shadowView removeFromSuperview];
    }];
    
}

-(void)updateTitleView
{
    
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

@end
