//
//  UIBarButtonItem+Extension.h
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CustomItem)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)imageName;

@end
