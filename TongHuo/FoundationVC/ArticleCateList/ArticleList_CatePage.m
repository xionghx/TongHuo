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

#define CELL_REUSE @"cellReuse"
@interface ArticleList_CatePage ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * articleListTableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation ArticleList_CatePage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.dataSource = @[].mutableCopy;
        [self loadDataSourceWithCid:[DataSourcePrepare DataSource].selectedItem[@"sCid"]];
        [self setupUI];
        
    }
    return self;
}
-(void)setupUI
{
    [self addSubview:self.articleListTableView];
}

-(UITableView *)articleListTableView
{
    if (_articleListTableView == nil) {
        _articleListTableView =[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _articleListTableView.delegate =self;
        _articleListTableView.dataSource =self;
        _articleListTableView.estimatedRowHeight = 200;
        [_articleListTableView registerClass:[ArticleList_CatePageCell class] forCellReuseIdentifier:CELL_REUSE];
    }
    return _articleListTableView;
}
#pragma mark --------------<UITableViewDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%ld",self.dataSource.count);
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleList_CatePageCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSE];
    [cell setupDataWitDataSource:self.dataSource[indexPath.row]];
    return cell;
}

-(void)loadDataSourceWithCid:(NSString *)sCid
{
    [NetRequest getArticleListWithCid:sCid andTname:@"" andKeyWord:@"" SPage:@"" andSPagesize:@"10" andCompletionBlock:^(id responseObject, NSError *error) {
        if (error) {
            NSLog(@"ArticleList_CatePage\ngetArticleListWithCid\n%@",error);
        }else{
            [self.dataSource  addObjectsFromArray: responseObject[@"info"][@"data"]];
            [self.articleListTableView reloadData];

        };
    }];
}

@end