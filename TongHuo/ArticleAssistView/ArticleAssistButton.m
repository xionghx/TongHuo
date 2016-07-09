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
    [aButton.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(aButton.mas_left);
        make.right.equalTo(aButton.mas_centerX);
    }];
    [aButton.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(aButton.mas_centerX);
        make.right.equalTo(aButton.mas_right);
   }];
//    aButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//    aButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    return aButton;
}

@end
