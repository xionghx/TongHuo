//
//  LeftSideView.m
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "LeftSideView.h"
#import "LeftSideCell.h"
#import "NetRequest+Article.h"
#import "XStringUtils.h"
#import "LoginView.h"
#import "DataSourcePrepare.h"
#import "ArticleCateListViewController.h"
#import "XNavigationController.h"
#import "SpecialListViewController.h"
#import "UserInfoViewController.h"
#import "LeftSideCell.h"



#define REUSE_MARK @"cell_reuse"




@interface LeftSideView ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray * imageNames;
@property(nonatomic,strong)UIButton * useInformation;
@property(nonatomic,strong)UIButton * specialButton;
@property(nonatomic,strong)NSArray *  dataSouce;
@end

@implementation LeftSideView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 0.5 * SCREEN_W, SCREEN_H);
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self addSubview: self.specialButton];
    [self addSubview: self.useInformation];
    [self addSubview:self.tableView];
    [self loadDataSource];
}

-(NSArray *)imageNames
{
    if (_imageNames == nil) {
        NSMutableArray * aArray = @[].mutableCopy;
        NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"imageName" ofType:@"png" inDirectory:@""]];
        for (NSString * aName in dic.allValues) {
            [aArray addObject:aName];
        }
        _imageNames = aArray;
    }
    return _imageNames;
}

-(UIButton *)useInformation
{
    if (_useInformation == nil) {
        _useInformation = [UIButton buttonWithType:UIButtonTypeCustom];
        _useInformation.layer.cornerRadius = 30;
        _useInformation.bounds = CGRectMake(0, 0, 60, 60);
        _useInformation.centerX = 0.25 * SCREEN_W;
        _useInformation.centerY = 0.25 * SCREEN_W;
        _useInformation.layer.borderWidth = 3;
        _useInformation.layer.borderColor = [UIColor whiteColor].CGColor;
        _useInformation.backgroundColor = [UIColor blackColor];
        [_useInformation addTarget:self action:@selector(useInformationButtonTaped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _useInformation;
}
-(UIButton *)specialButton
{
    if (_specialButton == nil) {
        _specialButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _specialButton.bounds = CGRectMake(0, 0, self.width, 50);
        _specialButton.centerX = 0.25 * SCREEN_W;
        _specialButton.y = 0.5*SCREEN_W;
        [_specialButton setTitle:@"专题" forState:UIControlStateNormal];
        [_specialButton addTarget:self action:@selector(specialButtonTaped) forControlEvents:UIControlEventTouchUpInside];
        _specialButton.backgroundColor = MainColor;
        
    }
    return _specialButton;
}
-(void)specialButtonTaped
{
    UIViewController *rootVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
    [self.delegate hideLeftSide];
    [(XNavigationController *)rootVC pushViewController:[SpecialListViewController new] animated:YES];
    
}

-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.specialButton.y + self.specialButton.height, self.width, self.height -(self.specialButton.y + self.specialButton.height)) style:UITableViewStylePlain];
        [_tableView registerClass:[LeftSideCell class] forCellReuseIdentifier:REUSE_MARK];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 55;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}
#pragma mark -------------------------------------<UITableViewDataSource,UITableViewDelegate>

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [DataSourcePrepare DataSource].selectedItem = [DataSourcePrepare DataSource].articleCateList[indexPath.row];
    
    UIViewController *rootVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
    [self.delegate hideLeftSide];
    [(XNavigationController *)rootVC pushViewController:[ArticleCateListViewController new] animated:YES];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSouce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftSideCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_MARK];
    //    cell.backgroundColor = [UIColor redColor];
    [cell setValueWithCname:self.dataSouce[indexPath.row][@"sCname"]];
//    cell.textLabel.text = self.dataSouce[indexPath.row][@"sCname"];
//    cell.imageView.image = [[NSObject new] imageInMainBundleWithName:[NSString stringWithFormat:@"%@选中",self.dataSouce[indexPath.row][@"sCname"]] andType:@"png" andDirectory:@""];
    return cell;
    
}


-(void)loadDataSource
{
    [NetRequest getArticleCateList:^(id responseObject, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }else{
            NSArray * array =responseObject[@"info"][@"data"];
            self.dataSouce = array;
            [DataSourcePrepare DataSource].articleCateList = self.dataSouce.mutableCopy;
            [self.tableView reloadData];
        }
    }];
}
-(void)useInformationButtonTaped
{
    UIViewController *rootVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
    [self.delegate hideLeftSide];
    [(XNavigationController *)rootVC pushViewController:[UserInfoViewController new] animated:YES];
    
    
    //    [LoginView showLoginView];
}

@end
