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

- (instancetype)initWithDateSource:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.dataSource = @[].mutableCopy;
        self.view.backgroundColor = [UIColor whiteColor];
        [self loadDataSourceWithID:data[@"sId"]];
        [self setupUIWithData:data];
        
        
        
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

    
    [self.tableViewHeaderView addSubview:self.thumbImageView];
    [self.tableViewHeaderView addSubview:self.titleLabel];
    [self.tableViewHeaderView addSubview:self.lineView];
    [self.tableViewHeaderView addSubview:self.introLabel];

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
    
    [self.speciaInfoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.bottom.equalTo(self.view);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.width.equalTo(self.view);
    }];
    
    
    
    
    [self.thumbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.tableViewHeaderView);
        make.top.mas_equalTo(self.tableViewHeaderView).offset(20);
        make.width.and.height.offset(100);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.tableViewHeaderView);
        make.top.mas_equalTo(self.thumbImageView.mas_bottom).offset(20);
        make.width.mas_equalTo(self).multipliedBy(0.8);
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
        make.width.mas_equalTo(self).multipliedBy(0.9);
        
    }];
    
    

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


-(UIImageView *)thumbImageView
{
    if (_thumbImageView == nil) {
        _thumbImageView = [[UIImageView alloc]init];
        _thumbImageView.layer.cornerRadius = 50;
        _thumbImageView.layer.masksToBounds = YES;
        _thumbImageView.backgroundColor = [UIColor clearColor];
    }
    return _thumbImageView;
}
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
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



-(UIView *)tableViewHeaderView
{
    if (_tableViewHeaderView == nil) {
        
    }
    return _tableViewHeaderView;
}
-(UILabel *)cellTitleLabel
{
    if (_cellTitleLabel == nil) {
        _cellTitleLabel = [[UILabel alloc]init];
        _cellTitleLabel.text = @"专题详情";
        _cellTitleLabel.textAlignment = NSTextAlignmentCenter;
        
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
-(UITableView *)speciaInfoTableView
{
    if (_speciaInfoTableView == nil) {
        _speciaInfoTableView = [[UITableView alloc]init];
        [_speciaInfoTableView registerClass:[SpecialInfoCell class] forCellReuseIdentifier:REUSE_MARK];
        _speciaInfoTableView.delegate = self;
        _speciaInfoTableView.dataSource = self;
        _speciaInfoTableView.estimatedRowHeight = 400;
        _speciaInfoTableView.tableHeaderView = self.tableViewHeaderView;
        
    }
    return _speciaInfoTableView;
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
{   SpecialInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_MARK];
    [cell setupValuesWith:self.dataSource[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.navigationController pushViewController:[[ArticleDetailVC alloc]initWitDataSource:self.dataSource[indexPath.row]] animated:YES];
    
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end
