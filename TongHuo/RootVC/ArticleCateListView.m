//
//  ArticleCateListView.m
//  TongHuo
//
//  Created by xionghuanxin on 7/11/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleCateListView.h"
#import "ArticleCateListCell.h"
#import "Masonry.h"
@interface ArticleCateListView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *articleCateListTableView;
@end

@implementation ArticleCateListView
- (instancetype)init
{
    self = [super init];
    if (self) {
//        self
    }
    return self;
}
-(void)layoutSubviews
{
    [self addSubview:self.articleCateListTableView];
}
-(UITableView *)articleCateListTableView
{
    if (_articleCateListTableView == nil) {
        _articleCateListTableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _articleCateListTableView.dataSource = self;
        _articleCateListTableView.delegate = self;
        _articleCateListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_articleCateListTableView registerClass:[ArticleCateListCell class] forCellReuseIdentifier:@"asd"];
    }
    return _articleCateListTableView;
}
#pragma mark------<UITableViewDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleCateListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"asd" forIndexPath:indexPath];
    
    return cell;
}

@end
