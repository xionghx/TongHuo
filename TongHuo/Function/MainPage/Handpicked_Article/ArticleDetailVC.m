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
#import "ArticleAssistBar.h"
#import "UIImageView+WebCache.h"



@interface ArticleDetailVC ()<UIScrollViewDelegate,UIWebViewDelegate>
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)UIButton *headerViewButton;
@property(nonatomic,strong)UIWebView *articleWebView;
@property(nonatomic,assign)CGPoint lastPosition;
@property(nonatomic,strong)ArticleAssistBar * footerViewBar;
@property(nonatomic,strong)UIButton *footerViewBackButton;
@property(nonatomic,strong)NSDictionary * dataSource;
@property(nonatomic,strong)UIImageView * avatarImageView;
@property(nonatomic,strong)UILabel *authorLabel;
@property(nonatomic,strong)UILabel *hitnumLabel;
@property(nonatomic,strong)UILabel *articleTotalLabel;
//@property(nonatomic,strong)


@end

@implementation ArticleDetailVC
-(void)setupValue
{
    [self.avatarImageView sd_setImageWithURL:self.dataSource[@"sUserinfo"][@"sAvatar"] ];
    self.authorLabel.text =self.dataSource[@"sUserinfo"][@"sUsername"];
    self.hitnumLabel.text = self.dataSource[@"sUserinfo"][@"sHitTotal"];
    self.articleTotalLabel.text = self.dataSource[@"sUserinfo"][@"sArticleTotal"];
    //    self.footerViewBar.shareurlButton
    [self.footerViewBar.comTotalButton setTitle:self.dataSource[@"sComTotal"] forState:UIControlStateNormal];
    [self.footerViewBar.zanTotalButton setTitle:self.dataSource[@"sZanTotal"] forState:UIControlStateNormal];
}
#pragma mark -------getter


-(void)updateViewConstraints
{
    [_articleWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.left.equalTo(self.view);
        //        make.top.equalTo(self.view);
        //        make.width.equalTo(self.view);
        //        make.height.equalTo(self.view);
        make.edges.equalTo(self.view);
    }];
    
    [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.offset(60);
    }];
    
    [_footerViewBackButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.footerView).offset(10);
        make.centerY.mas_equalTo(self.footerView);
        make.width.and.height.offset(40);
    }];
    
    [_footerViewBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.footerView).offset(-10);
        make.bottom.mas_equalTo(_footerView).offset(-10);
//        make.height.mas_equalTo(20);
        //        make.size.mas_equalTo(CGSizeMake(180, 20));
    }];
    
    [_headerViewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view);
        make.height.offset(100);
    }];
    
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_headerViewButton).offset(20);
        make.top.mas_equalTo(_headerViewButton).offset(20);
        make.width.and.height.offset(40);
    }];
    
    [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_avatarImageView.mas_right).offset(10);
        make.top.mas_equalTo(_avatarImageView.mas_top);
    }];
    
    [_hitnumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_authorLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(_authorLabel);
    }];
    
    [_articleTotalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_headerViewButton).offset(-5);
        make.bottom.mas_equalTo(_headerViewButton).offset(-5);
        make.width.offset(100);
        make.height.offset(40);
    }];
    
    [super updateViewConstraints];
}
-(void)setupUI
{
    [self.view addSubview:self.articleWebView];
    [self.view addSubview:self.footerView];
    [self.view addSubview:self.headerViewButton];
    [self.footerView addSubview:self.footerViewBackButton];
    [self.footerView addSubview:self.footerViewBar];
    [self.headerViewButton addSubview:self.avatarImageView];
    [self.headerViewButton addSubview:self.authorLabel];
    [self.headerViewButton addSubview:self.hitnumLabel];
    [self.headerViewButton addSubview:self.articleTotalLabel];
}

-(UILabel *)articleTotalLabel
{
    if (_articleTotalLabel == nil) {
        _articleTotalLabel = [[UILabel alloc]init];
        _articleTotalLabel.layer.borderColor = [UIColor redColor].CGColor;
        _articleTotalLabel.layer.borderWidth = 1;
        _articleTotalLabel.layer.masksToBounds = YES;
    }
    return _articleTotalLabel;
}
-(UILabel *)hitnumLabel
{
    if (_hitnumLabel == nil) {
        _hitnumLabel = [[UILabel alloc]init];
        _hitnumLabel.font = [UIFont systemFontOfSize:9];
    }
    return _hitnumLabel;
}
-(UILabel *)authorLabel
{
    if (_authorLabel == nil) {
        _authorLabel = [[UILabel alloc]init];
        _authorLabel.font = [UIFont systemFontOfSize:11];
    }
    return _authorLabel;
}
-(UIImageView *)avatarImageView
{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc]init];
    }
    return _avatarImageView;
}
-(ArticleAssistBar *)footerViewBar
{
    if (_footerViewBar == nil) {
        _footerViewBar = [[ArticleAssistBar alloc]init];
    }
    return _footerViewBar;
}
-(UIButton *)footerViewBackButton
{
    if (_footerViewBackButton == nil) {
        _footerViewBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_footerViewBackButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"白色返回" ofType:@"png" inDirectory:@""]] forState:UIControlStateNormal];
        [_footerViewBackButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _footerViewBackButton;
}

- (instancetype)initWitDataSource:(NSDictionary *)dataSource
{
    self = [super init];
    if (self) {
        _dataSource = @{}.copy;
        [self loadDataSourceWithId:dataSource[@"sId"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    
}
-(UIView *)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]init];
        _footerView.backgroundColor = MainColor;
    }
    return _footerView;
}
-(UIButton *)headerViewButton
{
    if (_headerViewButton == nil) {
        _headerViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //        _headerViewButton.frame = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_H-64, SCREEN_W, 64)];
        _headerViewButton.backgroundColor = MainColor;
        
    }
    return _headerViewButton;
}
-(UIWebView *)articleWebView
{
    if (_articleWebView == nil) {
        _articleWebView = [[UIWebView alloc]init];
        _articleWebView.scrollView.delegate = self;
        _articleWebView.delegate = self;
    }
    return _articleWebView;
}
-(void)loadDataSourceWithId:(NSString *)sId
{
    [NetRequest getArticleInfoWithsID:sId andCompletionBlock:^(id responseObject, NSError *error) {
        if (error) {
            NSLog(@"ArticleDetailVC\nloadDataSourceWithId:\n%@",error);
        }else{
            self.dataSource = (NSDictionary*)(responseObject[@"info"][@"data"]);
            [self.articleWebView loadHTMLString:responseObject[@"info"][@"data"][@"sHtml"] baseURL:nil];
            [self setupValue];
        }
    }];
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
    self.headerViewButton.alpha = 1;
    self.footerView.alpha = 1;
}

-(void)hideHeaderAndFooter:(void(^)(CGPoint location)) block

{
    self.headerViewButton.alpha = 0;
    self.footerView.alpha = 0;
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"didstart");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"stoped");
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
