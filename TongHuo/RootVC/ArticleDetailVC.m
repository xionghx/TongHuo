//
//  ArticleDetailVC.m
//  TongHuo
//
//  Created by xionghuaxin on 7/13/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleDetailVC.h"
#import "ArticleAssistBar.h"
#import "NetRequest+Article.h"
#import "XStringUtils.h"


@interface ArticleDetailVC ()<UIScrollViewDelegate,UIWebViewDelegate>
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)UIWebView *articleWebView;
@property(nonatomic,assign)CGPoint lastPosition;


@end

@implementation ArticleDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataSource];
    [self setupUI];
    self.view.backgroundColor = MainColor;
    
}
-(void)setupUI
{
    [self.view addSubview:self.articleWebView];

    [self.view addSubview:self.headerView];
    [self.view addSubview:self.footerView];
}
-(UIView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 80)];
        _headerView.backgroundColor = MainColor;
    }
    return _headerView;
}
-(UIView *)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_H-64, SCREEN_W, 64)];
        _footerView.backgroundColor = MainColor;
        
    }
    return _footerView;
}
-(UIWebView *)articleWebView
{
    if (_articleWebView == nil) {
        _articleWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
        _articleWebView.scrollView.delegate = self;
        _articleWebView.delegate = self;
    }
    return _articleWebView;
}
-(void)loadDataSource
{
//    [NetRequest getArticleInfoWithsID:@"276" andCompletionBlock:^(id responseObject, NSError *error) {
////        NSLog(@"%@",[XStringUtils jsonStringWithParameters: responseObject]);
//        [self.articleWebView loadHTMLString:responseObject[@"info"][@"data"][@"sHtml"] baseURL:nil];
//
//    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint currentPosition = scrollView.contentOffset;
    if (currentPosition.y - self.lastPosition.y >10) {
        [self hideHeaderAndFooter:^(CGPoint location) {
            
            
        }];
        self.lastPosition = currentPosition;

    }
    
    if (currentPosition.y - self.lastPosition.y <-10) {
        [self showHeaderAndFooter:^(CGPoint location) {
          
            
        }];
        self.lastPosition = currentPosition;
    }
    
}

-(void)showHeaderAndFooter:(void(^)(CGPoint location)) block
{
    self.headerView.alpha = 1;
    self.footerView.alpha = 1;
}

-(void)hideHeaderAndFooter:(void(^)(CGPoint location)) block

{
    self.headerView.alpha = 0;
    self.footerView.alpha = 0;

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

@end
