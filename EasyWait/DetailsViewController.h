//
//  DetailsViewController.h
//  EasyWait
//
//  Created by Ruchin on 03/09/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonObject.h"
#import "HttpManager.h"
#import "MyLoader.h"
#import "UIView+Toast.h"

@interface DetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timingLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSString *address;
@property(strong,nonatomic)NSString *timing;

@end
