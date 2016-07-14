//
//  SimpleCateListView.h
//  TongHuo
//
//  Created by xionghuaxin on 7/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SimpleCateDelegate <NSObject>
-(void)loadDataWithCate:(NSString *)sCid;
@end

@interface SimpleCateListView : UIView
@property(nonatomic,assign)id<SimpleCateDelegate> delegate;

@end
