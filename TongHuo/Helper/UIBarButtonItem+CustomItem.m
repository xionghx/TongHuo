//
//  UIBarButtonItem+Extension.m
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "UIBarButtonItem+CustomItem.h"

@implementation UIBarButtonItem (CustomItem)

/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)imageName imageInset:(UIEdgeInsets)inset
{
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle  mainBundle] pathForResource:imageName ofType:@"png" inDirectory:@""]] style:UIBarButtonItemStylePlain target:target action:action];
    item.tintColor = [UIColor whiteColor];
    [item setImageInsets:inset];
    return item;

}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)imageName
{
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    



    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle  mainBundle] pathForResource:imageName ofType:@"png" inDirectory:@""]] style:UIBarButtonItemStylePlain target:target action:action];
    item.tintColor = [UIColor whiteColor];
    [item setImageInsets:UIEdgeInsetsMake(30, 10, 30, 0)];
//    [item setWidth:1000];
    
    
//    [item setCustomView:aView];
//    [item setValue:CGRectMake(0, 0, 40, 40) forKey:@"bounds"];
    // 设置图片
//    [btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle  mainBundle] pathForResource:imageName ofType:@"png" inDirectory:@""]] forState:UIControlStateNormal];
////    NSLog(@"%@",[[NSBundle  mainBundle] pathForResource:imageName ofType:@"png" inDirectory:@""]);
////    NSLog(@"%@",imageName);
//    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    btn.frame = CGRectMake(SCREEN_W - 60, 20, 44, 44);
//    [btn setImageEdgeInsets:UIEdgeInsetsMake(8, 13, 18, 13)];
//    btn.imageEdgeInsets = UIEdgeInsetsMake(8, 13, 18, 13);
//    btn.contentEdgeInsets = UIEdgeInsetsMake(8, 13, 8, 13);
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
//    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}
//
//+ (UIBarButtonItem *)itemWithTargat:(id)target action:(SEL)action image:(NSString *)imageName {
//    
////    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
////    image.image = [UIImage imageNamed:imageName];
////    image.userInteractionEnabled = YES;
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
//    view.backgroundColor = [UIColor whiteColor];
////    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
////    button.bounds = CGRectMake(0, 0, 32, 32);
////    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:view];
//    [item setAction:action];
//    [item setStyle:UIBarButtonItemStyleDone];
//    [item setTarget: target];
//
//    return item;
//}


@end
























