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

@interface NextViewController : UIViewController
{
    NSString *myToken;
}
//@property(strong,nonatomic)NSString *myLog;
@property CommonObject *myobject;
@property HttpManager *manager;
@end
