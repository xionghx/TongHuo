////
////  LUntilsTools.m
////  Q1603_0703
////
////  Created by LuSW on 16/7/4.
////  Copyright © 2016年 rimi. All rights reserved.
////
//
//#import "XUtilityTools.h"
//#import "AppDelegate.h"
//
//@interface XUtilityTools ()
//
//
//@end
//
//@implementation XUtilityTools
//
//+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title ? title:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//    [alertController addAction:sureAction];
//    [[XUtilityTools keyPresentingViewController] presentViewController:alertController animated:YES completion:nil];
//}
//
//+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message buttonAction:(void (^)())buttonAction {
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title ? title:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        if (buttonAction) {
//            buttonAction();
//        }
//    }];
//    [alertController addAction:sureAction];
//    
//    [[XUtilityTools keyPresentingViewController] presentViewController:alertController animated:YES completion:nil];
//}
//
//+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message actionsMsg:(NSArray *)actionsMsg buttonActions:(void (^)(int))buttonActions {
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title ? title:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
//    
//    int index = 0;
//    for (NSString *actionMsg in actionsMsg) {
//        UIAlertAction *action = [UIAlertAction actionWithTitle:actionMsg style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            if (buttonActions) {
//                buttonActions(index);
//            }
//        }];
//        [alertController addAction:action];
//        index++;
//    }
//    [[XUtilityTools keyPresentingViewController] presentViewController:alertController animated:YES completion:nil];
//
//}
//
//+ (UIViewController *)keyPresentingViewController {
//    UIViewController *presentVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
//    while (presentVC.presentedViewController) {
//        presentVC = presentVC.presentedViewController;
//    }
//    return presentVC;
//}
//
//
//
//@end
//
//
//
//
//
//
//
//
//
//
