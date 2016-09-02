//
//  CommonObject.m
//  AddNum
//
//  Created by ruchin somal on 19/05/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "CommonObject.h"

NSString *const BASEURL = @"http://ewait.lkfans.org/api/";
NSString *const LOGIN = @"/login";
NSString *const OTP_VERIFY = @"ADDRESS";
NSString *const SET_NAME = @"PROPERTY";
NSString *const NEXT_TURN = @"NEARBY";
NSString *const RESET_TURN = @"http://www.addnum.com/addnum.php?shortcut=";
NSString *const PUBLIC_INFO = @"";
NSString *const GET_INFO = @"";
NSString *const APP_SHARE_URL = @"https://geo.itunes.apple.com/in/app/addnum/id1064093460?mt=8";

@implementation CommonObject
+ (id)sharedObject {
    static CommonObject *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

+(void)showAlertViewShow:(NSString *)message OnViewController:(UIViewController *)viewController YesAction:(void (^)(UIAlertAction *yesAction))yesHandler;
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"ERROR"
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Yes"
                                style:UIAlertActionStyleDefault
                                handler:yesHandler];
    
    [alert addAction:yesButton];
    
    [viewController presentViewController:alert animated:YES completion:nil];
}
@end
