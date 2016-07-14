//
//  XAlertViewHelper.h
//  account book
//
//  Created by xionghuanxin on 7/1/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//typedef void(^XAlertViewHelperFinishBlock)(NSString * _Nonnull text);



@interface XAlertViewHelper : NSObject
+(void)showAlerViewWithTitle:(NSString *)title AndMessage:(NSString *)message;
+(void)showAlerViewWithTitle:(NSString *)title
                  AndMessage:(NSString *)message
           AndActionMessages:(NSArray *)actionMessage
            AndButtonActionS:(NSString * (^)(NSString * )) block;

+(void)showAlertViewWithMessage:(NSString * )message target:(id )target block:(void(^)())block;
//- (void)showInputAlertViewWithMessage:(NSString *)message block:(XAlertViewHelperFinishBlock)block;
//
//- (void)showConfirmAlertViewWithMessage:(NSString *)message block:(XAlertViewHelperFinishBlock)block;
//
//- (void)showAlertViewWithMessage:(NSString *)message;


@end


