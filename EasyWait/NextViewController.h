//
//  NextViewController.h
//  EasyWait
//
//  Created by ruchin somal on 08/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonObject.h"
#import "HttpManager.h"
#import "MyLoader.h"
#import "UIView+Toast.h"
#import "InfoViewController.h"

@interface NextViewController : UIViewController

//@property(strong,nonatomic)NSString *myLog;
@property CommonObject *myobject;
@property HttpManager *manager;
@property(strong,nonatomic)NSString *myToken;
@end
