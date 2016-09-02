//
//  MyLoader.h
//  AddNum
//
//  Created by ruchin somal on 10/05/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLoader : UIView
+ (void)showLoadingView;
+ (void)hideLoadingView;
+ (UIImage *) imageWithView:(UIView *)view;
@end
