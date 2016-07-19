//
//  ArticleCateListViewController.m
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleCateListViewController.h"
#import "ArticleList_CatePage.h"
#import "DataSourcePrepare.h"
#import "ArticleCateCollectionViewCell.h"

#define REUSE_CATE @"articleCateCollectionViewCell"

@interface ArticleCateListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)UITextField *searchTextField;
@property(nonatomic,strong)UICollectionView *articleCateCollectionView;
@property(nonatomic,strong)ArticleList_CatePage *articileListView;
//@property(nonatomic,strong)

@end

@implementation ArticleCateListViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}

#pragma mark -------------getter

-(void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backButton];
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(10);
        make.top.mas_equalTo(self.view).offset(20);
        make.width.and.height.offset(40);
    }];

    [_backButton.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.mas_equalTo(20);
    }];
    
    [self.view addSubview:self.searchTextField];
    [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_backButton.mas_right).offset(20);
        make.top.mas_equalTo(self.view).offset(20);
        make.width.offset(0.7 * SCREEN_W);
        make.height.offset(40);
    }];
    
    [self.view addSubview:self.articleCateCollectionView];
    [_articleCateCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_searchTextField.mas_bottom).offset(10);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(80);
    }];
    
    [self.view addSubview:self.articileListView];
    [_articileListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_articleCateCollectionView.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(self.view.width);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
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
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UITextField *)searchTextField
{
    if (_searchTextField == nil) {
        _searchTextField = [[UITextField alloc]init];
        _searchTextField.placeholder = @"🔍 搜索文章";
    }
    return _searchTextField;
}

-(UICollectionView *)articleCateCollectionView
{
    if (_articleCateCollectionView == nil) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(60, 60);

        _articleCateCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, 80) collectionViewLayout:layout];
        [_articleCateCollectionView registerClass:[ArticleCateCollectionViewCell class] forCellWithReuseIdentifier:REUSE_CATE];
        _articleCateCollectionView.delegate = self;
        _articleCateCollectionView.dataSource = self;
        _articleCateCollectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _articleCateCollectionView;
}
-(ArticleList_CatePage *)articileListView
{
    if (_articileListView == nil) {
        _articileListView = [[ArticleList_CatePage alloc]init];
        _articileListView.backgroundColor = [UIColor redColor];
        
//        [_articileListView loadDataSourceWithCid:[DataSourcePrepare DataSource].articleCateList[0][@"sCid"]];
    }
    return _articileListView;
}
#pragma mark -- UICollectionViewDataSource
//指定分区有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [DataSourcePrepare DataSource].articleCateList.count;
}

//配置每一个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ArticleCateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:REUSE_CATE forIndexPath:indexPath];
    [cell setupDataWithDataSource:[DataSourcePrepare DataSource].articleCateList[indexPath.row]];
    return cell;
}
//点击cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    [DataSourcePrepare DataSource].selectedItem = [DataSourcePrepare DataSource].articleCateList[indexPath.row];
    [self.articileListView loadDataSourceWithCid:[DataSourcePrepare DataSource].selectedItem[@"sCid"]completionHandle:^{
        [collectionView reloadData];
    }];

}


@end
