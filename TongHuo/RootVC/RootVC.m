//
//  RootVC.m
//  TongHuo
//
//  Created by xionghuanxin on 7/7/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "RootVC.h"
#import "MainPageVC.h"

@interface RootVC ()
@property(nonatomic,strong)MainPageVC * mainPage;

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self interfaceInital];
    
    //    [self addChildViewController:self.mainPage];
    //    [self.mainPage didMoveToParentViewController:self];
    //    [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
}
-(void)interfaceInital
{
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.navigationItem.rightBarButtonItem setTarget:self];
    [self.navigationItem.rightBarButtonItem setAction:@selector(rightItemTaped)];

//    self.navigationItem.rightBarButtonItem = [UINavigationItem alloc]setRightBarButtonItem:<#(nullable UIBarButtonItem *)#> animated:<#(BOOL)#>
    
    //    self.navigationItem.rightBarButtonItem = nil;
    //    NSLog(@"%p\n%p",@selector(rightItemTaped),self.navigationItem.rightBarButtonItem.action);
}
-(MainPageVC *)mainPage
{
    if (_mainPage == nil) {
        _mainPage = [[MainPageVC alloc]init];
        
    }
    return _mainPage;
}

-(void)rightItemTaped
{
    [self.navigationController pushViewController:self.mainPage animated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //    [super touchesBegan:touches withEvent:event];
    //    [self presentViewController:[MainPageVC new] animated:YES completion:^{
    //
    //    }];
    [self presentViewController:self.mainPage animated:YES completion:^{
        
    }];
    //     //    [self.navigationController pushViewController:self.mainPage animated:YES];
}
@end
















