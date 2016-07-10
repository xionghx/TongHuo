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
//        make.left.equalTo(aButton.mas_left);
        make.right.equalTo(aButton.mas_centerX);
        
//        make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, aButton.width * 0.5));
        make.width.and.height.equalTo(aButton.mas_width).multipliedBy(0.5);
    }];
    [aButton.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(aButton.mas_centerX);
//        make.right.equalTo(aButton.mas_right);
//        make.edges.mas_offset(UIEdgeInsetsMake(0, aButton.width * 0.5, 0, 0));

        make.width.and.height.equalTo(aButton.mas_width).multipliedBy(0.5);

   }];
    [aButton.titleLabel setTextColor:[UIColor grayColor]];
    aButton.titleLabel.textColor = [UIColor grayColor];
    aButton.backgroundColor = [UIColor redColor];
//    aButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//    aButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    return aButton;
}

@end
