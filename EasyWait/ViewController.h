//
//  ViewController.h
//  EasyWait
//
//  Created by ruchin somal on 07/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    NSString *mNumber;
    NSString *otpNum;
    NSString *name;
    NSMutableArray *array ;
}
@property (strong , nonatomic)NSDictionary *responseDict ;
@property (strong , nonatomic)NSDictionary *verifyDict ;
@property (strong , nonatomic)NSDictionary *nameDict ;
@end

