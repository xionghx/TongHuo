//
//  ShadowView.m
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ShadowView.h"

@implementation ShadowView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H);
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
@end
