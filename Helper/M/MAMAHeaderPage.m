//
//  MAMAHeaderPage.m
//  童伙妈妈
//
//  Created by xionghuanxin on 7/4/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "MAMAHeaderPage.h"

@interface MAMAHeaderPage ()
@property(nonatomic,strong)UISegmentedControl * segmentedControl;
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation MAMAHeaderPage

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self.view addSubview:self.segmentedControl];
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(SCREEN_W, 0, SCREEN_W, 603);
        [self addSubview:self.scrollView];
    }
    return self;
}

-(UISegmentedControl *)segmentedControl
{
    if (_segmentedControl == nil) {
        _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"全部",@"娱乐影视",@"亲子教育",@"社会万象",@"生活购物",@"热点聚焦"]];
        _segmentedControl.bounds = CGRectMake(0, 0, SCREEN_W * 0.8, 40);
        _segmentedControl.center = CGPointMake(0.5 * SCREEN_W, 20);
    }
    return _segmentedControl;
}
-(UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, self.segmentedControl.frame.size.height)];
        _scrollView.contentSize = CGSizeMake(SCREEN_W, 0);
        _scrollView.showsVerticalScrollIndicator =NO;
        [_scrollView addSubview:self.segmentedControl];
    }
    return _scrollView;
}
@end
