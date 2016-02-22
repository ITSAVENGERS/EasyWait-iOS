//
//  ViewController.h
//  EasyWait
//
//  Created by ruchin somal on 07/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIBaseManager.h"
#import "otpViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    APIBaseManager *baseManager;
    NSString *mNumber;
    NSString *name;
    NSMutableArray *array ;
}
@end

