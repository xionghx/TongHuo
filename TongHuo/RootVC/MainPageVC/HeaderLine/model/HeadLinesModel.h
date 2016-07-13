//
//  HeadLinesModel.h
//  童伙妈妈
//
//  Created by LuSW on 16/7/10.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HeadLinesModel : NSObject

/** 是否为选中*/
@property (nonatomic,assign)BOOL            selected;
/** 标题*/
@property (nonatomic,copy)NSString          *sTitle;
/** 时间戳*/
@property (nonatomic,copy)NSString          *sAddtime;
/** 内容简介*/
@property (nonatomic,copy)NSString          *sIntro;
/** 原文链接*/
@property (nonatomic,copy)NSString          *sLink;

@property (nonatomic,assign)CGFloat         cellHeight;

+ (NSArray *)loadDataSourceWithArray:(NSArray *)dataArray;

@end
