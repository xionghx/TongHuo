//
//  HeadLinesModel.m
//  童伙妈妈
//
//  Created by LuSW on 16/7/10.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "HeadLinesModel.h"

@implementation HeadLinesModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}

+ (NSArray *)loadDataSourceWithArray:(NSArray *)dataArray {
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    
    for (NSDictionary *infoDic in dataArray) {
        NSMutableArray *sList = [NSMutableArray arrayWithArray:infoDic[@"sList"]];
        
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dic in sList) {
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:[dic[@"sAddtime"] doubleValue]];
            NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd HH:mm";
            NSString * string = [formatter stringFromDate:date];
            
            HeadLinesModel *model = [[HeadLinesModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            model.selected = NO;
            model.sAddtime = string;
            [models addObject:model];
            
            
        }
        [resultArray addObject:models];
    }
    
    
    return resultArray;
}

@end
