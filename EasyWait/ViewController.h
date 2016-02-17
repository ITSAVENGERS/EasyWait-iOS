//
//  ViewController.h
//  EasyWait
//
//  Created by ruchin somal on 07/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIBaseManager.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    APIBaseManager *baseManager;
    NSString *mNumber;
    NSString *name;
    NSMutableArray *array ;
}
@property (strong , nonatomic)NSDictionary *responseDict ;
@property (strong , nonatomic)NSDictionary *verifyDict ;
@property (strong , nonatomic)NSDictionary *nameDict ;
@end

