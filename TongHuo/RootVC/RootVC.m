//
//  RootVC.m
//  TongHuo
//
//  Created by xionghuanxin on 7/7/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "RootVC.h"
#import "MainPageVC.h"
#import "LeftSideView.h"
#import "ShadowView.h"
#import "XNavigationController.h"
#import "NetRequest+Article.h"
#import "ArticleListTableViewCell.h"
#import "NetRequest+Prepare_Fro.h"



static NSString * reUseMark = @"articleListTableViewCell";

@interface RootVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)XNavigationController * mainPage;
@property(nonatomic,strong)LeftSideView * leftSide;
@property(nonatomic,strong)ShadowView * shadowView;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UITableView *articleListTableView;
@property(nonatomic,strong)NSMutableArray *articleList;
@property(nonatomic,strong)NSMutableArray * articleListTableViewCells;
@end

@implementation RootVC
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.leftSide loadDataSource];
    //    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self preferredStatusBarStyle] ;
    //    self.preferredStatusBarStyle = UIStatusBarStyleDefault;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    [super preferredStatusBarStyle];
    return UIStatusBarStyleLightContent;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self interfaceInital];
}
-(void)interfaceInital
{
    self.view.backgroundColor = [UIColor yellowColor];
    self.automaticallyAdjustsScrollViewInsets = false;
    [self.navigationItem.rightBarButtonItem setAction:@selector(rightItemTaped)];
    [self.navigationItem.leftBarButtonItem setAction:@selector(leftItemTaped)];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.articleListTableView];
    
    
    //    [self addChildViewController:self.mainPage];
    //    [self.mainPage didMoveToParentViewController:self];
    //    [self.view addSubview:self.mainPage.view];
    [((XNavigationController *)(self.navigationController)).titleViewLeftButton addTarget:self action:@selector(titleViewLeftButtonTaped) forControlEvents:UIControlEventTouchUpInside];
    [((XNavigationController *)(self.navigationController)).titleViewRightButton addTarget:self action:@selector(titleViewRightButtonTaped) forControlEvents:UIControlEventTouchUpInside];
    
}
//-(XNavigationController *)mainPage
//{
//    if (_mainPage == nil) {
//        MainPageVC * mainVC = [MainPageVC new];
//        mainVC.rootVC = self;
//        _mainPage = [[XNavigationController alloc]initWithRootViewController:mainVC];
//    }
//    return _mainPage;
//}
-(UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64)];
        _scrollView.pagingEnabled = true;
        _scrollView.bounces = false;
        _scrollView.contentSize = CGSizeMake(2 * SCREEN_W,SCREEN_H-64);
        _scrollView.backgroundColor = [UIColor grayColor];
        _scrollView.delegate = self;
    }
    return _scrollView;
}
-(UITableView *)articleListTableView
{
    if (_articleListTableView == nil) {
        _articleListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-64) style:UITableViewStylePlain];
        _articleListTableView.dataSource = self;
        [_articleListTableView registerClass:[ArticleListTableViewCell class] forCellReuseIdentifier:reUseMark];
//                _articleListTableView.rowHeight = 600;
                _articleListTableView.rowHeight = UITableViewAutomaticDimension;
        _articleListTableView.estimatedRowHeight = 600;
        _articleListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //        _articleListTableView.selectionStyle =UITableViewCellSelectionStyleNone;
        
    }
    return _articleListTableView;
}

-(ShadowView *)shadowView
{
    if (_shadowView == nil) {
        _shadowView = [[ShadowView alloc]init];
        _shadowView.alpha = 0;
    }
    return _shadowView;
}
-(LeftSideView *)leftSide
{
    if (_leftSide == nil) {
        _leftSide  = [[LeftSideView alloc]init];
        _leftSide.x =-0.5 * SCREEN_W;
        _leftSide.tableView.delegate = self;
    }
    return _leftSide;
}

-(void)rightItemTaped
{
    //    [self.navigationController pushViewController:self.mainPage animated:YES];
}

-(void)leftItemTaped
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.shadowView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.leftSide];
    [UIView animateWithDuration:0.2 animations:^{
        self.leftSide.x = 0;
        self.shadowView.alpha = 0.3;
    } completion:^(BOOL finished) {
        UITapGestureRecognizer * shadowGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftSideHide)];
        [self.shadowView addGestureRecognizer:shadowGesture];
        
    }];
}

-(void)leftSideHide
{
    [UIView animateWithDuration:0.2 animations:^{
        self.shadowView.alpha = 0;
        self.leftSide.x = -0.5 * SCREEN_W;
    } completion:^(BOOL finished) {
        [self.shadowView removeFromSuperview];
    }];
    
}

-(void)titleViewLeftButtonTaped
{
    [UIView animateWithDuration:0.2 animations:^{
        ((XNavigationController *)(self.navigationController)).animationLine.x = 0;
        self.scrollView.contentOffset= CGPointMake(0, self.scrollView.contentOffset.y);
    } completion:^(BOOL finished) {
        ((XNavigationController *)(self.navigationController)).titleViewRightButton.selected = NO;
        ((XNavigationController *)(self.navigationController)).titleViewLeftButton.selected = YES;
        
    }];
    
}


-(void)titleViewRightButtonTaped
{
    [UIView animateWithDuration:0.2 animations:^{
        ((XNavigationController *)(self.navigationController)).animationLine.x = 100;
        self.scrollView.contentOffset= CGPointMake(SCREEN_W, self.scrollView.contentOffset.y);
    } completion:^(BOOL finished) {
        ((XNavigationController *)(self.navigationController)).titleViewRightButton.selected = YES;
        ((XNavigationController *)(self.navigationController)).titleViewLeftButton.selected = NO;
    }];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    ((XNavigationController *)(self.navigationController)).animationLine.x = 100*scrollView.contentOffset.x/SCREEN_W;
    if (scrollView.contentOffset.x > 0.5 * SCREEN_W) {
        ((XNavigationController *)(self.navigationController)).titleViewRightButton.selected = YES;
        ((XNavigationController *)(self.navigationController)).titleViewLeftButton.selected = NO;
    }else{
        ((XNavigationController *)(self.navigationController)).titleViewRightButton.selected = NO;
        ((XNavigationController *)(self.navigationController)).titleViewLeftButton.selected = YES;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articleList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseMark forIndexPath:indexPath];
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
    //    ArticleListTableViewCell *cell = (ArticleListTableViewCell *)(self.articleListTableViewCells[indexPath.row]);
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
    //        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:cell.sThumb]];
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            cell.thumbImage.image = [UIImage imageWithData:data];
    //        });
    //    });
    //    [cell.thumbImage sd_setImageWithURL:[NSURL URLWithString:((NSString *)(self.articleList[indexPath.row][@"sThumb"]))]];
    //    cell.titleLabel.text = self.articleList[indexPath.row][@"sTitle"];
    //    cell.introLabel.text = self.articleList[indexPath.row][@"sIntro"];
    //
    //    [cell.avatarButton sd_setImageWithURL:[NSURL URLWithString:self.articleList[indexPath.row][@"sAvatar"]] forState:UIControlStateNormal];
    //    [cell.avatarButton setTitle:self.articleList[indexPath.row][@"sUsername"] forState:UIControlStateNormal];
    //    cell.assistBar.collectTotalButton.titleLabel.text =self.articleList[indexPath.row][@"sCollectTotal"];
    //    cell.assistBar.zanTotalButton.titleLabel.text = self.articleList[indexPath.row][@"sZanTotal"];
    //    cell.catenameButton.titleLabel.text =self.articleList[indexPath.row][@"sCatename"];
    //    cell.dataSources = self.articleList[indexPath.row];
    [cell setupWithDataSource:self.articleList[indexPath.row] andComplitionHandel:^(CGFloat a) {
//        cell.height = a;
//        self.articleListTableView.rowHeight = a + 40;
//        [self.articleListTableView layoutSubviews];
//                NSLog(@"%f",a);
        cell.xHeight = a;
        [self.articleListTableView layoutSubviews];
    }];
    return cell;
}
-(void)loadData
{
    //    [NetRequest shareArticleListWithCompletionBlock:^(id responseObject, NSError *error) {
    //        self.articleList = responseObject[@"info"][@"data"];
    //        [self.articleListTableView reloadData];
    //
    //    }];
    
    [NetRequest getArticleListWithSPage:@"" andSPagesize:@"1" andCompletionBlock:^(id responseObject, NSError *error) {
        [self.articleList addObjectsFromArray: responseObject[@"info"][@"data"] ];
        [self.articleListTableView reloadData];
        [NetRequest getArticleListWithSPage:@"" andSPagesize:@"100" andCompletionBlock:^(id responseObject, NSError *error) {
            [self.articleList removeAllObjects];
            [self.articleList addObjectsFromArray: responseObject[@"info"][@"data"] ];
            [self.articleListTableView reloadData];
            
            //            [self.articleList arrayByAddingObjectsFromArray: responseObject[@"info"][@"data"]];
            //            NSLog(@"%@",self.articleList);
            //            [self.articleListTableView reloadData];
            
        }];
        
        
    }];
    //    self.articleListTableViewCells = @[].mutableCopy;
    //    [NetRequest getArticleListWithSPage:@"1" andSPagesize:@"2" andCompletionBlock:^(id responseObject, NSError *error) {
    //        if (error) {
    //            NSLog(@"%@",error);
    //        }else{
    //            self.articleList = responseObject;
    ////            for (NSDictionary * dic in self.articleList) {
    ////                ArticleListTableViewCell * cell = [[ArticleListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reUseMark];
    ////                for (NSString * key in dic.allKeys) {
    ////                    [cell setValue:dic[key] forKey:key];
    ////                }
    ////                [self.articleListTableViewCells addObject:cell];
    ////            }
    //            [self.articleListTableView reloadData];
    //            NSLog(@"%@",self.articleList);
    //        }
    //    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%f/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n",((ArticleListTableViewCell *)[self.articleListTableView cellForRowAtIndexPath:indexPath]).xHeight);
//    return ((ArticleListTableViewCell *)[self.articleListTableView cellForRowAtIndexPath:indexPath]).xHeight;
    return 500;
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"asdffffffffffff");
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
}
-(NSMutableArray *)articleList
{
    if (_articleList == nil) {
        _articleList = @[].mutableCopy;
    }
    return _articleList;
}

@end
















