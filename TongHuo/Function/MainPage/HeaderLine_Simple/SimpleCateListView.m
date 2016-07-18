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
@property(nonatomic,assign)NSInteger *selectedButtonTag;
@end

@implementation SimpleCateListView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.simpleCateDataSource = [NSMutableArray array];
        self.userInteractionEnabled = YES;
        [self loadDataSource];
    }
    return self;
}
-(void)setupUI
{
    [self addSubview: self.simpleCateListScrollView];
    
    NSInteger index = 0;
    for (NSDictionary * dic in self.simpleCateDataSource) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 200 + index;
        [button setTitleColor:MainColor forState:UIControlStateSelected];
        [button setTitle:dic[@"sCname"] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        if (self.selectedButtonTag - button.tag == 0) {
            button.titleLabel.textColor = MainColor;
        }
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTaped:) forControlEvents:UIControlEventTouchUpInside];
        [self.simpleCateListScrollView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(60);
            make.width.mas_equalTo(60);
            make.centerY.mas_equalTo(_simpleCateListScrollView);
            make.left.mas_equalTo(_simpleCateListScrollView).offset(index*65);
        }];
        index ++;
    }
    ((UIButton*)[self viewWithTag:200]).selected = YES;
    ((UIButton*)[self viewWithTag:200]).titleLabel.font = [UIFont systemFontOfSize:14];
    

    
}
-(void)buttonTaped:(UIButton *)sender
{
    
    
    for (NSInteger index = 0; index < self.simpleCateDataSource.count; index++) {
        if (sender.tag-200-index ==0) {
            ((UIButton*)[self viewWithTag:index + 200]).selected = YES;
            ((UIButton*)[self viewWithTag:index + 200]).titleLabel.font = [UIFont systemFontOfSize:14];


        }else{
            ((UIButton*)[self viewWithTag:index + 200]).selected = NO;
            ((UIButton*)[self viewWithTag:index + 200]).titleLabel.font = [UIFont systemFontOfSize:12];
        }
    }
    [self.delegate loadDataWithCate:self.simpleCateDataSource[sender.tag-200][@"sCid"]];
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
        _simpleCateListScrollView.contentSize =CGSizeMake(1.1*SCREEN_W, 0);
        _simpleCateListScrollView.backgroundColor = [UIColor lightGrayColor];
    }
    return _simpleCateListScrollView;
}
-(void)loadDataSource
{
    [NetRequest getSimpleCateList:^(id responseObject, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }else{
            [self.simpleCateDataSource addObject:@{@"sCid":@"",@"sCname":@"全部"}];
            [self.simpleCateDataSource addObjectsFromArray:responseObject[@"info"][@"data"]];
            [self.delegate loadDataWithCate:self.simpleCateDataSource[0][@"sCid"]];
            [self setupUI];
        }
    }];
}

@end
