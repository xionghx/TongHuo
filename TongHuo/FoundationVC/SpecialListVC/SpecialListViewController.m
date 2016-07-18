//
//  SpecialListViewController.m
//  TongHuo
//
//  Created by xionghuaxin on 7/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "SpecialListViewController.h"
#import "SpecialListCell.h"
#import "NetRequest+Special.h"
#import "SpecialInfoVC.h"


#define REUSE_CELL @"specialistCell_reuse"

@interface SpecialListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UIButton *backButton;
@property(nonatomic, strong)UITableView *specialistTableView;
@property(nonatomic, strong)NSMutableArray *dataSource;


@end

@implementation SpecialListViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = @[].mutableCopy;
        self.view.backgroundColor = [UIColor whiteColor];
        [self loadDataSource];
        [self setupUI];
        
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)setupUI
{
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.specialistTableView];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(@64);
    }];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(10);
        make.top.mas_equalTo(self.view).offset(20);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    
    [self.specialistTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.bottom.equalTo(self.view);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.width.equalTo(self.view);
    }];
}





-(void)loadDataSource
{
    [NetRequest getSpecialListWithId:@"" andPage:@"" andPagesize:@"2" completion:^(id responseObject, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }else{
            [self.dataSource addObjectsFromArray:responseObject[@"info"][@"data"] ];
            [self.specialistTableView reloadData];
            [NetRequest getSpecialListWithId:@"" andPage:@"" andPagesize:@"10" completion:^(id responseObject, NSError *error) {
                if (error) {
                    NSLog(@"%@",error);
                }else{
                    [self.dataSource addObjectsFromArray:responseObject[@"info"][@"data"] ];
                    [self.specialistTableView reloadData];
                }
            }];

        }
    }];
}















#pragma mark -------------getter
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"专题";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
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
-(UITableView *)specialistTableView
{
    if (_specialistTableView == nil) {
        _specialistTableView = [[UITableView alloc]init];
        [_specialistTableView registerClass:[SpecialListCell class] forCellReuseIdentifier:REUSE_CELL];
        _specialistTableView.delegate = self;
        _specialistTableView.dataSource = self;
        _specialistTableView.estimatedRowHeight = 400;
        
    }
    return _specialistTableView;
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --<UITableViewDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   SpecialListCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_CELL];
    [cell setupValuesWith:self.dataSource[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   SpecialInfoVC *newVC = [[SpecialInfoVC alloc]init];
    [newVC setupUIWithData:self.dataSource[indexPath.row]];
    
    [self.navigationController pushViewController:newVC animated:YES];
    
}

@end
