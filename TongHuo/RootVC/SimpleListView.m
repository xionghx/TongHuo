//
//  ArticleCateListView.m
//  TongHuo
//
//  Created by xionghuanxin on 7/11/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//
#define reuseMark @"cellReuse"
#import "SimpleListView.h"
#import "SimpleListCell.h"
#import "Masonry.h"
#import "NetRequest+Simple.h"

@interface SimpleListView ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic,strong)UITableView *simpleListTableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)NSIndexPath *lastSelectedPath;
@property(nonatomic,assign)NSIndexPath *IntroLabelShowedPath;
@property(nonatomic,assign)NSIndexPath *currentSelectedPath;
@property(nonatomic,strong)UIView *tableHeaderView;
@property(nonatomic,strong)UILabel *tableHeaderLabelOne;
@property(nonatomic,strong)UILabel  *tableHeaderLabelTwo;
@property(nonatomic,strong)UIView * lineView;


@end

@implementation SimpleListView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataSource = @[].mutableCopy;
        [self loadDataSource];
    }
    return self;
}
-(void)layoutSubviews
{
    [self addSubview:self.simpleListTableView];
}

-(void)loadDataSource
{
    [NetRequest getSimpleListWithSPage:@"3" andSPagesize:@"30" andSCid:@"" andSRegion:@"" andCompletionBlock:^(id responseObject, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }else{
            [self.dataSource addObjectsFromArray: responseObject[@"info"][@"data"]];
            NSLog(@"%@",self.dataSource);
            [self.simpleListTableView reloadData];
        }
        
    }];

}
-(UITableView *)simpleListTableView
{
    if (_simpleListTableView == nil) {
        _simpleListTableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _simpleListTableView.dataSource = self;
        _simpleListTableView.delegate = self;
        _simpleListTableView.estimatedRowHeight = 100;
        _simpleListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _simpleListTableView.sectionHeaderHeight = 60;
        _simpleListTableView.sectionFooterHeight = 0;
//        _simpleListTableView.tableHeaderView = self.tableHeaderView;
        [_simpleListTableView registerClass:[SimpleListCell class] forCellReuseIdentifier:reuseMark];
    }
    return _simpleListTableView;
}
-(UIView *)tableHeaderView
{
    if (_tableHeaderView == nil) {
        _tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 60)];
        _tableHeaderView.backgroundColor = [UIColor redColor];
        [_tableHeaderView addSubview:self.lineView];
        [_tableHeaderView addSubview:self.tableHeaderLabelOne];
        [_tableHeaderView addSubview:self.tableHeaderLabelTwo];
        
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(1);
            make.height.equalTo(_tableHeaderView);
            make.left.mas_equalTo(_tableHeaderView).offset(20);
            make.top.mas_equalTo(_tableHeaderView).offset(0);
        }];

        [_tableHeaderLabelOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(_tableHeaderView.mas_height).multipliedBy(0.8);
            make.centerX.mas_equalTo(_tableHeaderView.mas_left).offset(20);
            make.centerY.mas_equalTo(_tableHeaderView);
        }];
        
        [_tableHeaderLabelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_tableHeaderLabelOne.mas_right).offset(20);
            make.centerY.mas_equalTo(_tableHeaderLabelOne);
            make.height.equalTo(_tableHeaderLabelOne).multipliedBy(0.5);
        }];
    }
    return _tableHeaderView;
}
-(UIView *)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor blackColor];
    }
    return _lineView;
    
}

-(UILabel *)tableHeaderLabelOne
{
    if (_tableHeaderLabelOne == nil) {
        _tableHeaderLabelOne = [[UILabel alloc]init];
        _tableHeaderLabelOne.backgroundColor = [UIColor blackColor];
        _tableHeaderLabelOne.numberOfLines = 2;
        _tableHeaderLabelOne.textAlignment = NSTextAlignmentCenter;
        _tableHeaderLabelOne.layer.cornerRadius = 5;
        _tableHeaderLabelOne.layer.masksToBounds = YES;
        _tableHeaderLabelOne.textColor = [UIColor whiteColor];
    }
    return _tableHeaderLabelOne;
}
-(UILabel *)tableHeaderLabelTwo
{
    if (_tableHeaderLabelTwo == nil) {
        _tableHeaderLabelTwo = [[UILabel alloc]init];
    }
    return _tableHeaderLabelTwo;
}
#pragma mark------<UITableViewDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray*)(self.dataSource[section][@"sList"])).count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.tableHeaderLabelOne.text = [NSString stringWithFormat:@"%@\n%@", self.dataSource[section][@"sMonth "],self.dataSource[section][@"sData"]];
    self.tableHeaderLabelTwo.text = self.dataSource[section][@"sDate"];
    
    self.tableHeaderLabelOne.backgroundColor = [UIColor blackColor];
    return self.tableHeaderView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentSelectedPath = indexPath;
    
    [self.simpleListTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    if (self.lastSelectedPath) {
        [self.simpleListTableView reloadRowsAtIndexPaths:@[self.lastSelectedPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
//    [self.simpleListTableView reloadData];
    self.lastSelectedPath = indexPath;
    self.currentSelectedPath = nil;

}

-(BOOL)shoudShowIntroLabelAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL should = NO;
    if (self.currentSelectedPath) {
        
        if (self.currentSelectedPath!=self.IntroLabelShowedPath) {
            should = YES;
            self.IntroLabelShowedPath = indexPath;
        }else{
            self.IntroLabelShowedPath =nil;
        }
    }
    
    return should;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleListCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseMark forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setupDataWitDataSource:self.dataSource[indexPath.section][@"sList"][indexPath.row]withIndexPath:indexPath andShouldShowIntroLabel:[self shoudShowIntroLabelAtIndexPath:indexPath]];
    return cell;
}
@end