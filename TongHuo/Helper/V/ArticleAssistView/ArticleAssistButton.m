//
//  ArticleAssistButton.m
//  TongHuo
//
//  Created by xionghuanxin on 7/9/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ArticleAssistButton.h"
#import "Masonry.h"

@implementation ArticleAssistButton
+(instancetype)buttonWithType:(UIButtonType)buttonType
{
    ArticleAssistButton * aButton = [super buttonWithType:buttonType];
    aButton.frame = CGRectMake(0, 0, 60, 20);
    [aButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    return aButton;
}
-(void)updateConstraints
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(self.mas_height);
        make.left.equalTo(self);
    }];
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
    }];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
//    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    

    [super updateConstraints];
}


@end
