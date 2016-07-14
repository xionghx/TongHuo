//
//  ModelVCSimple.m
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ModelVCSimple.h"

@interface ModelVCSimple ()

@end

@implementation ModelVCSimple

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.searchTexfield];
}
-(UIButton *)backButton
{
    if (_backButton == nil) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(10, 20, 44, 44);
        _backButton.backgroundColor = [UIColor redColor];
        [_backButton addTarget:self action:@selector(backButtonTaped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}
-(UITextField *)searchTexfield
{
    if (_searchTexfield == nil) {
        _searchTexfield = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.backButton.frame), 20, 200, 44)];
        _searchTexfield.placeholder =self.searchTexfieldPlaceholder;
    }
    return _searchTexfield;
}

-(void)backButtonTaped
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
