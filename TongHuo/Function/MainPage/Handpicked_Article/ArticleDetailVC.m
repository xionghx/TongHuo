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
-(void)setupUI
{
    WEAK_SELF
    [self.view addSubview:self.articleWebView];
    [_articleWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view);
        make.width.equalTo(weakSelf.view);
        make.height.equalTo(weakSelf.view);
    }];
    
    [self.view addSubview:self.footerView];
    [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view);
        make.width.equalTo(weakSelf.view);
        make.height.offset(60);
    }];
    
    [self.footerView addSubview:self.footerViewBackButton];
//
//    [_footerViewBackButton mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.left.mas_equalTo(_footerViewBackButton).offset(10);
//                make.top.mas_equalTo(_footerViewBackButton).offset(10);
//                make.width.and.height.offset(50);
//
//    }];
    [_footerViewBackButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_footerView).offset(10);
        make.top.mas_equalTo(_footerView).offset(10);
        make.width.and.height.offset(50);
    }];
    
    
    
    [self.footerView addSubview:self.footerViewBar];
//    [_footerViewBar mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(_footerView);
//        make.bottom.mas_equalTo(_footerView);
//
//    }];
    [_footerViewBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_footerView);
        make.bottom.mas_equalTo(_footerView);
        make.width.offset(200);
        make.height.offset(40);
    }];

    
    
    
    [self.view addSubview:self.headerViewButton];
    [_headerViewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view);
        make.top.mas_equalTo(weakSelf.view);
        make.width.mas_equalTo(weakSelf.view);
        make.height.offset(100);
        
    }];
    [self.headerViewButton addSubview:self.avatarImageView];
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_headerViewButton).offset(20);
        make.top.mas_equalTo(_headerViewButton).offset(20);
        make.width.and.height.offset(40);
    }];
    [self.headerViewButton addSubview:self.authorLabel];
    [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_avatarImageView.mas_right).offset(10);
        make.top.mas_equalTo(_avatarImageView.mas_top);
    }];
    [self.headerViewButton addSubview:self.hitnumLabel];
    [_hitnumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_authorLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(_authorLabel);
    }];
    [self.headerViewButton addSubview:self.articleTotalLabel];
    [_articleTotalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_headerViewButton).offset(-5);
        make.bottom.mas_equalTo(_headerViewButton).offset(-5);
        make.width.offset(100);
        make.height.offset(40);
    }];
    
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
        [_footerViewBackButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"黑色返回" ofType:@"" inDirectory:@""]] forState:UIControlStateNormal];
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
    self.view.backgroundColor = MainColor;
    
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
//        NSLog(@"%@",[XStringUtils jsonStringWithParameters: responseObject]);
        
        
        
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
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

@end
