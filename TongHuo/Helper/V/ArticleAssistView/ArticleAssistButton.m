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
    return aButton;
}
-(void)updateConstraints
{
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(self.mas_height);
        make.left.equalTo(self);
        //        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 2));
        //        make.right.equalTo(aButton.titleLabel.mas_left).offset(-5);
        
    }];
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        //        make.left.equalTo(aButton).offset(5);
        ////        make.left.mas_equalTo(aButton.centerX);
        ////        make.edges.insets(UIEdgeInsetsMake(0, aButton.height, 0, 0));
        make.height.equalTo(self);
        //        make.width.equalTo(aButton.mas_height).multipliedBy(2);
        //        make.right.equalTo(aButton);
        //        make.right.equalTo(aButton);
    }];
    //    aButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //    aButton.imageView.mas_key = @"raButton.imageView";
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    

    [super updateConstraints];
}


@end
