//
//  ModelVCClassed.m
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ModelVCClassed.h"

@interface ModelVCClassed ()
//@property(nonatomic,strong)UIButton * backButton;
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation ModelVCClassed
-(UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        NSInteger index = 0;
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, 50)];
        _scrollView.contentSize = CGSizeMake(SCREEN_W + 1, 0);
        for (NSDictionary * dic in self.scrollViewData) {
            UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.bounds = CGRectMake(0, 0, 30, 30);
            button.center = CGPointMake(30 * index, 15);
            [button setTitle:dic[@"sCname"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(scrollViewButtonTapde) forControlEvents:UIControlEventTouchUpInside];
            index ++;
        }
        
    }
    return _scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
}
-(void)scrollViewButtonTapde
{
    
}

@end
