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

@interface RootVC ()
@property(nonatomic,strong)XNavigationController * mainPage;
@property(nonatomic,strong)LeftSideView * leftSide;
@property(nonatomic,strong)ShadowView * shadowView;

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self interfaceInital];
}
-(void)interfaceInital
{
//    self.view.backgroundColor = [UIColor yellowColor];
//    [self.navigationItem.rightBarButtonItem setAction:@selector(rightItemTaped)];
//    [self.navigationItem.leftBarButtonItem setAction:@selector(leftItemTaped)];
    [self addChildViewController:self.mainPage];
    [self.mainPage didMoveToParentViewController:self];
    [self.view addSubview:self.mainPage.view];
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

-(void)rightItemTaped
{
    [self.navigationController pushViewController:self.mainPage animated:YES];
}

-(void)leftItemTaped
{
    [self.view addSubview:self.shadowView];
    [self.view addSubview:self.leftSide];
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //    [super touchesBegan:touches withEvent:event];
    //    [self presentViewController:[MainPageVC new] animated:YES completion:^{
    //
    //    }];
    
    
    //    [self presentViewController:[[XNavigationController alloc]initWithRootViewController:self.mainPage]animated:YES completion:^{
    //    }];
    //     //    [self.navigationController pushViewController:self.mainPage animated:YES];
}
@end
















