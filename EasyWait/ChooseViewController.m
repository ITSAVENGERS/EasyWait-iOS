//
//  ChooseViewController.m
//  EasyWait
//
//  Created by Ruchin on 03/09/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "ChooseViewController.h"

@interface ChooseViewController ()

@end

@implementation ChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects: (id)[[UIColor colorWithRed:0/255.0 green:195/255.0 blue:147/255.0 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
