//
//  InfoViewController.h
//  EasyWait
//
//  Created by ruchin somal on 09/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonObject.h"
#import "HttpManager.h"
#import "MyLoader.h"

@interface InfoViewController : UIViewController
{
    NSString *infoNumber;
}
@property CommonObject *myobject;
@property HttpManager *manager;
@end
