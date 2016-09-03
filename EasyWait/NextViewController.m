//
//  NextViewController.m
//  EasyWait
//
//  Created by ruchin somal on 08/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
{
    int counterValue;
}
- (IBAction)IncBTN:(id)sender;
- (IBAction)ResetBTN:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *nextLoader;
@property (weak, nonatomic) IBOutlet UILabel *counterDisplay;
@end

@implementation NextViewController
- (void)viewDidLoad {
    self.manager = [HttpManager sharedManager];
    self.myobject = [CommonObject sharedObject];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects: (id)[[UIColor colorWithRed:0/255.0 green:195/255.0 blue:147/255.0 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    self.counterDisplay.layer.borderWidth = 1.0;
    counterValue=0;
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)IncBTN:(id)sender {
    counterValue++;
    self.counterDisplay.text=[NSString stringWithFormat:@"%d", counterValue];
    [self set_reset_counter:@"next"];
}

- (IBAction)ResetBTN:(id)sender {
    counterValue=0;
    self.counterDisplay.text=[NSString stringWithFormat:@"%d", counterValue];
    [self set_reset_counter:@"reset"];
}

-(void)set_reset_counter:(NSString *)type {
    [MyLoader showLoadingView];
    NSString *url;
    if ([type isEqualToString:@"next"]) {
        url = [NSString stringWithFormat:@"%@%@%@",BASEURL,NEXT_TURN,self.myToken];
    } else {
        url = [NSString stringWithFormat:@"%@%@%@",BASEURL,RESET_TURN,self.myToken];
    }
    [self.manager getRequestWithCallBack:nil andUrl:url withCallback:^(BOOL wasSuccessful, NSDictionary *dict) {
        [MyLoader hideLoadingView];
        if (wasSuccessful) {
            [self.view makeToast:@"Your turn is updated !!!" duration:2.0 position:CSToastPositionCenter];
        } else {
            [self.view makeToast:@"Something went Wrong ,We are working on it !!!" duration:2.0 position:CSToastPositionCenter];
        }
    }];
}

@end
