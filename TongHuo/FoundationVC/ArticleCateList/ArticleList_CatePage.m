//
//  ArticleList_CatePage.m
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleList_CatePage.h"
#import "ArticleList_CatePageCell.h"
#import "NetRequest+Article.h"
#import "DataSourcePrepare.h"
#import "MJRefresh.h"

#define CELL_REUSE @"cellReuse"
@interface ArticleList_CatePage ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * articleListTableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation ArticleList_CatePage

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        self.dataSource = @[].mutableCopy;
        [self loadDataSourceWithCid:[DataSourcePrepare DataSource].selectedItem[@"sCid"]completionHandle:^{
        }];
        [self setupUI];
        
    }
    return self;
}
-(void)setupUI
{
    WEAK_SELF
    [self addSubview:self.articleListTableView];
    [_articleListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.left.width.bottom.width.right.equalTo(weakSelf);
    }];
    
}

-(UITableView *)articleListTableView
{
    if (_articleListTableView == nil) {
        _articleListTableView =[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _articleListTableView.delegate =self;
        _articleListTableView.dataSource =self;
        _articleListTableView.estimatedRowHeight = 100;
        _articleListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        MJRefreshFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            NSString * PageSizeStr = [NSString stringWithFormat:@"%ld",self.dataSource.count + 6];
            [NetRequest getArticleListWithCid:[DataSourcePrepare DataSource].selectedItem[@"sCid"] andTname:@"" andKeyWord:@"" SPage:@"" andSPagesize:PageSizeStr andCompletionBlock:^(id responseObject, NSError *error) {
                
                [_articleListTableView.mj_footer endRefreshing];
                if (error) {
                    NSLog(@"ArticleList_CatePage\ngetArticleListWithCid\n%@",error);
                }else{
                    [self.dataSource removeAllObjects];
                    [self.dataSource  addObjectsFromArray: responseObject[@"info"][@"data"]];
                    [self.articleListTableView reloadData];
                };
            }];

//            [self refreshDate];
        }];
//        MJRefreshFooter *footer = [MJRefreshAutoFooter forwardingTargetForSelector:@selector(refreshDate)];
        _articleListTableView.mj_footer = footer;
//        [self.articleListTableView.mj_footer setAutomaticallyHidden:YES];

//        [_articleListTableView.mj_footer beginRefreshing];
        [_articleListTableView registerClass:[ArticleList_CatePageCell class] forCellReuseIdentifier:CELL_REUSE];
    }
    return _articleListTableView;
}
#pragma mark --------------<UITableViewDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleList_CatePageCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSE];
    [cell setupDataWitDataSource:self.dataSource[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)loadDataSourceWithCid:(NSString *)sCid
            completionHandle:(void(^)())completionHadle
{
    [NetRequest getArticleListWithCid:sCid andTname:@"" andKeyWord:@"" SPage:@"" andSPagesize:@"4" andCompletionBlock:^(id responseObject, NSError *error) {
        if (error) {
            NSLog(@"ArticleList_CatePage\ngetArticleListWithCid\n%@",error);
        }else{
            [self.dataSource removeAllObjects];
            [self.dataSource  addObjectsFromArray: responseObject[@"info"][@"data"]];
            [self.articleListTableView reloadData];
            completionHadle();
            [NetRequest getArticleListWithCid:sCid andTname:@"" andKeyWord:@"" SPage:@"" andSPagesize:@"8" andCompletionBlock:^(id responseObject, NSError *error) {
                if (error) {
                    NSLog(@"ArticleList_CatePage\ngetArticleListWithCid\n%@",error);
                }else{
                    [self.dataSource removeAllObjects];
                    [self.dataSource  addObjectsFromArray: responseObject[@"info"][@"data"]];
                    [self.articleListTableView reloadData];
                    completionHadle();

                };
            }];


        };
    }];
}

-(void)refreshData
{
    NSString * PageSizeStr = [NSString stringWithFormat:@"%ld",self.dataSource.count + 6];
    [NetRequest getArticleListWithCid:[DataSourcePrepare DataSource].selectedItem[@"sCid"] andTname:@"" andKeyWord:@"" SPage:@"" andSPagesize:PageSizeStr andCompletionBlock:^(id responseObject, NSError *error) {
        if (error) {
            NSLog(@"ArticleList_CatePage\ngetArticleListWithCid\n%@",error);
            [self.articleListTableView reloadData];

        }else{
            [self.dataSource removeAllObjects];
            [self.dataSource  addObjectsFromArray: responseObject[@"info"][@"data"]];
            [self.articleListTableView reloadData];
        };
    }];

}
@end
