//
//  CommonObject.h
//  AddNum
//
//  Created by ruchin somal on 19/05/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const BASEURL;
FOUNDATION_EXPORT NSString *const LOGIN;
FOUNDATION_EXPORT NSString *const OTP_VERIFY;
FOUNDATION_EXPORT NSString *const SET_NAME;
FOUNDATION_EXPORT NSString *const NEXT_TURN;
FOUNDATION_EXPORT NSString *const RESET_TURN;
FOUNDATION_EXPORT NSString *const PUBLIC_INFO;
FOUNDATION_EXPORT NSString *const GET_INFO;
FOUNDATION_EXPORT NSString *const APP_SHARE_URL;

@interface CommonObject : NSObject
+ (id)sharedObject;

-(void)showAlertViewShow:(NSString *)message OnViewController:(UIViewController *)viewController YesAction:(void (^)(UIAlertAction *yesAction))yesHandler NoAction:(void (^)(UIAlertAction *noAction))noHandler;
-(void)showAlert:(NSString *)title andTitle:(NSString *)message onView:(UIViewController *)view;
@end
