//
//  ViewController.h
//  EasyWait
//
//  Created by ruchin somal on 07/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonObject.h"
#import "HttpManager.h"
#import "MyLoader.h"
#import "otpViewController.h"
#import "CWStatusBarNotification.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    
}
@property (strong, nonatomic) CWStatusBarNotification *notification;
@property CommonObject *myobject;
@property HttpManager *manager;
@end

