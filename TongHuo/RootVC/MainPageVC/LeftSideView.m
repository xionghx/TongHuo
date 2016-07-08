//
//  LeftSideView.m
//  TongHuo
//
//  Created by xionghuanxin on 7/8/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "LeftSideView.h"
#import "LeftSideCell.h"
#import "NetRequest+Article.h"
#import "XStringUtils.h"
#import "ModelVCClassed.h"
@interface LeftSideView ()<UITableViewDataSource>
@property(nonatomic,strong)NSArray * imageNames;
@property(nonatomic,strong)UIButton * useInformation;
@property(nonatomic,strong)UIButton * specialButton;
@property(nonatomic,strong)NSArray *  dataSouce;
@end

static NSString * cellReuse = @"reUseMark";
@implementation LeftSideView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 0.5 * SCREEN_W, SCREEN_H);
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self addSubview: self.specialButton];
    [self addSubview: self.useInformation];
    [self addSubview:self.tableView];
    [self loadDataSource];
}

-(NSArray *)imageNames
{
    if (_imageNames == nil) {
        NSMutableArray * aArray = @[].mutableCopy;
        NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"imageName" ofType:@"png" inDirectory:@""]];
        for (NSString * aName in dic.allValues) {
            [aArray addObject:aName];
        }
        _imageNames = aArray;
    }
    return _imageNames;
}

-(UIButton *)useInformation
{
    if (_useInformation == nil) {
        _useInformation = [UIButton buttonWithType:UIButtonTypeCustom];
        _useInformation.layer.cornerRadius = 30;
        _useInformation.bounds = CGRectMake(0, 0, 60, 60);
        _useInformation.centerX = 0.25 * SCREEN_W;
        _useInformation.centerY = 0.25 * SCREEN_W;
        _useInformation.layer.borderWidth = 3;
        _useInformation.layer.borderColor = [UIColor whiteColor].CGColor;
        _useInformation.backgroundColor = [UIColor blackColor];
    }
    return _useInformation;
}
-(UIButton *)specialButton
{
    if (_specialButton == nil) {
        _specialButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _specialButton.bounds = CGRectMake(0, 0, self.width, 50);
        _specialButton.centerX = 0.25 * SCREEN_W;
        _specialButton.y = 0.5*SCREEN_W;
        [_specialButton setTitle:@"专题" forState:UIControlStateNormal];
        _specialButton.backgroundColor = [UIColor grayColor];
        
    }
    return _specialButton;
}

-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.specialButton.y + self.specialButton.height, self.width, self.height -(self.specialButton.y + self.specialButton.height)) style:UITableViewStylePlain];
        NSLog(@"%f",self.centerX);
        [_tableView registerClass:[LeftSideCell class] forCellReuseIdentifier:cellReuse];
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSouce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftSideCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuse];
//    cell.backgroundColor = [UIColor redColor];
    cell.textLabel.text = self.dataSouce[indexPath.row][@"sCname"];
    cell.imageView.image = [[NSObject new] imageInMainBundleWithName:[NSString stringWithFormat:@"%@选中",self.dataSouce[indexPath.row][@"sCname"]] andType:@"png" andDirectory:@""];
    NSLog(@"%@",cell.imageView.image);
    return cell;
    
}


-(void)loadDataSource
{
    [NetRequest getArticleCateList:^(id responseObject, NSError *error) {
        //        NSLog(@"%@",[XStringUtils jsonStringWithParameters:responseObject]);
        //        NSLog(@"%@",responseObject[@"info"][@"data"]);
        if (error) {
            NSLog(@"%@",error);
        }else{
            NSArray * array =responseObject[@"info"][@"data"];
            self.dataSouce = array;
            NSLog(@"%@",self.dataSouce);
            [self.tableView reloadData];
        }
    }];
}

@end
