//
//  otpViewController.h
//  EasyWait
//
//  Created by ruchin somal on 18/02/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonObject.h"
#import "HttpManager.h"
#import "MyLoader.h"
#import "UIView+Toast.h"

@interface otpViewController : UIViewController<UITextFieldDelegate>
@property CommonObject *myobject;
@property HttpManager *manager;
@property(strong,nonatomic)NSString *mobileNumber;
@property(strong,nonatomic)NSString *otp_start;
@property(strong,nonatomic)NSString *service;
@property(strong,nonatomic)NSString *keymatch;
@end
