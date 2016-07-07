//
//  MainPageScroll.m
//  童伙妈妈
//
//  Created by xionghuanxin on 7/5/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "MainPageScroll.h"
#import "MAMAHeaderPage.h"

@implementation MainPageScroll
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        
//            self.bounds = CGRectMake(0, 0, SCREEN_W, 603);
//            self.center = CGPointMake(0.5 * SCREEN_W, 64+603*0.5);
//            NSLog(@"%f",SCREEN_H);
        self.contentSize = CGSizeMake(2*SCREEN_W, 0);
        self.backgroundColor = [UIColor redColor];
        self.pagingEnabled = YES;
//            [self addSubview:self.aButton];
        self.showsHorizontalScrollIndicator = NO;
        [self addSubview:[[MAMAHeaderPage alloc]init]];
      
    }
    return self;
}
@end
