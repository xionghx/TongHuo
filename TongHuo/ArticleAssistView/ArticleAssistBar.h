//
//  ArticleAssistBar.h
//  TongHuo
//
//  Created by xionghuanxin on 7/9/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleAssistButton.h"

@interface ArticleAssistBar : UIView
@property(nonatomic,strong)UIButton *shareurlButton;
@property(nonatomic,strong)UIButton *collectTotalButton;
@property(nonatomic,strong)ArticleAssistButton *zanTotalButton;
@property(nonatomic,strong)ArticleAssistButton *comTotalButton;

-(void)setLayout;

@end
