//
//  SimpleCateListView.m
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "SimpleCateListView.h"
#import "NetRequest+Simple.h"
@interface SimpleCateListView ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView * simpleCateListScrollView;
@property(nonatomic,strong)NSMutableArray *simpleCateDataSource;

@end

@implementation SimpleCateListView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.simpleCateDataSource = [NSMutableArray array];
        [self loadDataSource];
    }
    return self;
}
-(void)setupUI
{
    NSInteger index = 0;
    for (NSDictionary * dic in self.simpleCateDataSource) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 200 + index;
        [button setTitle:dic[@"sCname"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTaped:) forControlEvents:UIControlEventTouchUpInside];
        index ++;
    }
    
    
}
-(void)buttonTaped:(UIButton *)sender
{
    switch (sender.tag -200) {
        case 0:
            
            break;

        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        case 7:
            
            break;
        case 8:
            
            break;

            
        default:
            break;
    }
}
-(UIScrollView *)simpleCateListScrollView
{
    if (_simpleCateListScrollView == nil) {
        _simpleCateListScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _simpleCateListScrollView.delegate = self;
    }
    return _simpleCateListScrollView;
}
-(void)loadDataSource
{
    [NetRequest getSimpleCateList:^(id responseObject, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }else{
            [self.simpleCateDataSource addObjectsFromArray:responseObject[@"info"][@"data"]];
            NSLog(@"%@",self.simpleCateDataSource);
        }
    }];
}

@end
