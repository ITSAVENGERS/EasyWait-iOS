//
//  otpViewController.h
//  EasyWait
//
//  Created by ruchin somal on 18/02/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIBaseManager.h"

@interface otpViewController : UIViewController<UITextFieldDelegate>
{
    APIBaseManager *baseManager;
}
@property(strong,nonatomic)NSString *myNumber;
@end
