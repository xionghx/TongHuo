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
        make.width.and.height.equalTo(aButton.mas_height);
        make.left.equalTo(aButton);
    }];
    [aButton.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(aButton.mas_right);
    }];
    aButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [aButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    return aButton;
}


@end
