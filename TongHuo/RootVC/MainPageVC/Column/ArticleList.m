//
//  ArticleList.m
//  TongHuo
//
//  Created by xionghuaxin on 7/12/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleList.h"
#import "NetRequest+Article.h"
#import "ArticleListTableViewCell.h"
#import "NetRequest+Prepare_Fro.h"

#define reUseMark @"cellReuse"

@interface ArticleList ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * articleListTableView;
@property(nonatomic,strong)NSMutableArray *articleList;
@end

@implementation ArticleList

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.articleListTableView];
        [self loadData];
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
    [cell setupWithDataSource:self.articleList[indexPath.row] andComplitionHandel:^(CGFloat a) {
    }];
    return cell;
}

-(void)loadData
{
    [NetRequest getArticleListWithSPage:@"" andSPagesize:@"3" andCompletionBlock:^(id responseObject, NSError *error) {
        [self.articleList addObjectsFromArray: responseObject[@"info"][@"data"] ];
        [self.articleListTableView reloadData];
        [NetRequest getArticleListWithSPage:@"" andSPagesize:@"20" andCompletionBlock:^(id responseObject, NSError *error) {
            [self.articleList removeAllObjects];
            [self.articleList addObjectsFromArray: responseObject[@"info"][@"data"] ];
            [self.articleListTableView reloadData];
        }];
    }];
}


@end
