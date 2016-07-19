//
//  ArticleList.m
//  TongHuo
//
//  Created by xionghuaxin on 7/12/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleList.h"
#import "XNavigationController.h"
#import "NetRequest+Article.h"
#import "ArticleListTableViewCell.h"
#import "ArticleDetailVC.h"
#import "XAlertViewHelper.h"
#import "MJRefresh.h"

#define reUseMark @"cellReuse"

@interface ArticleList ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * articleListTableView;
@property(nonatomic,strong)NSMutableArray *articleList;
@property(nonatomic,assign)NSInteger *pagesize;
@end

@implementation ArticleList

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.articleListTableView];
        [self loadData];
        self.pagesize = 0;
        _articleList = @[].mutableCopy;
    }
    return self;
}
-(UITableView *)articleListTableView
{
    if (_articleListTableView == nil) {
        _articleListTableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _articleListTableView.dataSource = self;
        _articleListTableView.delegate = self;
        _articleListTableView.estimatedRowHeight = 400;
        _articleListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        MJRefreshFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//            NSString * PageSizeStr = [NSString stringWithFormat:@"%ld",(self.pagesize + 6)];
//            
//            [self loadDataSourceWithCid:[DataSourcePrepare DataSource].selectedItem[@"sCid"]completionHandle:^{
//                [collectionView reloadData];
//            }];
//
//            
//            [NetRequest getArticleListWithCid:@"" andTname:@"" andKeyWord:@"" SPage:@"" andSPagesize:@"2" andCompletionBlock:^(id responseObject, NSError *error) {
//                
//                [self.articleList addObjectsFromArray: responseObject[@"info"][@"data"] ];
//                [self.articleListTableView reloadData];
//                [NetRequest getArticleListWithCid:@"" andTname:@"" andKeyWord:@"" SPage:@"" andSPagesize:@"5" andCompletionBlock:^(id responseObject, NSError *error) {
//                    [self.articleList addObjectsFromArray: responseObject[@"info"][@"data"] ];
//                    [self.articleListTableView reloadData];
//                    
//                }];
//                
//            }];
//
//            
//            [NetRequest getArticleListWithCid:[DataSourcePrepare DataSource].selectedItem[@"sCid"] andTname:@"" andKeyWord:@"" SPage:@"" andSPagesize:PageSizeStr andCompletionBlock:^(id responseObject, NSError *error) {
//                
//                [_articleListTableView.mj_footer endRefreshing];
//                if (error) {
//                    NSLog(@"ArticleList_CatePage\ngetArticleListWithCid\n%@",error);
//                }else{
//                    [self.dataSource removeAllObjects];
//                    [self.dataSource  addObjectsFromArray: responseObject[@"info"][@"data"]];
//                    [self.articleListTableView reloadData];
//                };
//            }];
//            
//        }];
        //        MJRefreshFooter *footer = [MJRefreshAutoFooter forwardingTargetForSelector:@selector(refreshDate)];
//        _articleListTableView.mj_footer = footer;

        [_articleListTableView registerClass:[ArticleListTableViewCell class] forCellReuseIdentifier:reUseMark];
    }
    return _articleListTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articleList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseMark ];
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    [cell setupValueWith:self.articleList[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIViewController *rootVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
    [(XNavigationController *)rootVC pushViewController:[[ArticleDetailVC alloc]initWitDataSource:self.articleList[indexPath.row]] animated:YES];
}


-(void)loadData
{
    [NetRequest getArticleListWithCid:@"" andTname:@"" andKeyWord:@"" SPage:@"" andSPagesize:@"2" andCompletionBlock:^(id responseObject, NSError *error) {
    
    [self.articleList addObjectsFromArray: responseObject[@"info"][@"data"] ];
    [self.articleListTableView reloadData];
    [NetRequest getArticleListWithCid:@"" andTname:@"" andKeyWord:@"" SPage:@"" andSPagesize:@"5" andCompletionBlock:^(id responseObject, NSError *error) {
        [self.articleList addObjectsFromArray: responseObject[@"info"][@"data"] ];
        [self.articleListTableView reloadData];

    }];

}];
    
}


@end
