//
//  NextViewController.h
//  EasyWait
//
//  Created by ruchin somal on 08/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIBaseManager.h"

@interface NextViewController : UIViewController
{
    APIBaseManager *baseManager;
    NSString *myToken;
}
//@property(strong,nonatomic)NSString *myLog;
@end
