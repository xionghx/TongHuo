//
//  SpecialInfoVC.m
//  TongHuo
//
//  Created by xionghuaxin on 7/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "SpecialInfoVC.h"
#import "NetRequest+Special.h"
#import "SpecialInfoCell.h"
#import "ArticleDetailVC.h"
#import "UIImageView+WebCache.h"



#define REUSE_MARK @"cell_reuse"

@interface SpecialInfoVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UIButton *backButton;
@property(nonatomic, strong)UITableView *speciaInfoTableView;
@property(nonatomic, strong)NSMutableArray *dataSource;
@property(nonatomic, strong)UIView *tableViewHeaderView;

@property(nonatomic,strong)UIImageView *thumbImageView;
@property(nonatomic,strong)UILabel *cellTitleLabel;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *introLabel;


@end

@implementation SpecialInfoVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = @[].mutableCopy;
        self.view.backgroundColor = [UIColor whiteColor];
        
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)setupUIWithData:(NSDictionary*)data
{
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.speciaInfoTableView];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.width.mas_equalTo(SCREEN_W);
        make.height.mas_equalTo(64);
    }];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(10);
        make.top.mas_equalTo(self.view).offset(20);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    
    [self.speciaInfoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.bottom.equalTo(self.view);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.width.equalTo(self.view);
    }];
    
    [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:data[@"sThumb"]]];
    self.cellTitleLabel.text = data[@"sTitle"];
    self.introLabel.text = data[@"sIntro"];
    
    [self loadDataSourceWithID:data[@"sId"]];
}

#pragma mark --<UITableViewDelegate,UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   SpecialInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_MARK];
    [cell setupValuesWith:self.dataSource[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.navigationController pushViewController:[[ArticleDetailVC alloc]initWitDataSource:self.dataSource[indexPath.row]] animated:YES];
    
}





-(void)loadDataSourceWithID:(NSString *)sId
{
    [NetRequest getSpecialInfoWithId:sId andPage:@"1" andPagesize:@"3" completion:^(id responseObject, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }else{
            [self.dataSource addObjectsFromArray:responseObject[@"info"][@"data"][@"sAtricleList"] ];
            [self.speciaInfoTableView reloadData];
        }
    }];
}



#pragma mark -------------getter


-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"专题详情";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _titleLabel.backgroundColor = [UIColor redColor];
    }
    return _titleLabel;
}


-(UIButton *)backButton
{
    if (_backButton == nil) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"黑色返回" ofType:@"png" inDirectory:@""]] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

-(UIView *)tableViewHeaderView
{
    if (_tableViewHeaderView == nil) {
        _tableViewHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 100)];
        [_tableViewHeaderView addSubview:self.cellTitleLabel];
        [_tableViewHeaderView addSubview:self.lineView];
        [_tableViewHeaderView addSubview:self.introLabel];
        [_tableViewHeaderView addSubview:self.thumbImageView];

//        [self.tableViewHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(self.view);
//            make.top.equalTo(self.view);
//            make.left.equalTo(self.view);
//            make.height.equalTo(@100);
//        }];
        
        [self.thumbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tableViewHeaderView);
            make.top.mas_equalTo(self.tableViewHeaderView).offset(20);
            make.width.and.height.offset(80);
        }];
        
        [self.cellTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tableViewHeaderView);
            make.top.mas_equalTo(self.thumbImageView.mas_bottom).offset(20);
            make.width.mas_equalTo(self.thumbImageView).multipliedBy(0.8);
        }];
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tableViewHeaderView);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
            make.width.mas_equalTo(self.tableViewHeaderView);
            make.height.offset(1);
        }];
        [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tableViewHeaderView);
            make.top.mas_equalTo(self.lineView.mas_bottom).offset(20);
            make.width.mas_equalTo(self.thumbImageView).multipliedBy(0.9);
        }];
        
        
    }
    return _tableViewHeaderView;
}




-(UIImageView *)thumbImageView
{
    if (_thumbImageView == nil) {
        _thumbImageView = [[UIImageView alloc]init];
        _thumbImageView.layer.cornerRadius = 40;
        _thumbImageView.layer.masksToBounds = YES;
    }
    return _thumbImageView;
}



-(UILabel *)cellTitleLabel
{
    if (_cellTitleLabel == nil) {
        _cellTitleLabel = [[UILabel alloc]init];
        _cellTitleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titleLabel;
}



-(UIView *)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor blackColor];
    }
    return _lineView;
}

-(UILabel *)introLabel
{
    if (_introLabel == nil) {
        _introLabel = [[UILabel alloc]init];
        _introLabel.numberOfLines = 0;
    }
    return _introLabel;
}

-(UITableView *)speciaInfoTableView
{
    if (_speciaInfoTableView == nil) {
        _speciaInfoTableView = [[UITableView alloc]init];
        [_speciaInfoTableView setTableHeaderView:self.tableViewHeaderView];
        [_speciaInfoTableView registerClass:[SpecialInfoCell class] forCellReuseIdentifier:REUSE_MARK];
        _speciaInfoTableView.delegate = self;
        _speciaInfoTableView.dataSource = self;
        _speciaInfoTableView.rowHeight = 300;
//        _speciaInfoTableView.tableHeaderView = self.tableViewHeaderView;
        
    }
    return _speciaInfoTableView;
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
