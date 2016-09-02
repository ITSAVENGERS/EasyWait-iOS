//
//  otpViewController.m
//  EasyWait
//
//  Created by ruchin somal on 18/02/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "otpViewController.h"

@interface otpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *otpTextFIeld;
- (IBAction)VerifyBTN:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
- (IBAction)SetNameAndNextView:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *setName;

@end

@implementation otpViewController
@synthesize mobileNumber;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager = [HttpManager sharedManager];
    self.myobject = [CommonObject sharedObject];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects: (id)[[UIColor colorWithRed:0/255.0 green:195/255.0 blue:147/255.0 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    self.setName.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)VerifyBTN:(id)sender {
     NSString *otp = self.otpTextFIeld.text;
    if (self.otpTextFIeld.text ==nil && [self.otpTextFIeld.text isEqualToString:@""])
    {
        
    }
    else
    {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Error"
                                      message:@"Mobile number is Empty"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Ok"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        [self resignFirstResponder];
                                        
                                        
                                    }];
        
        [alert addAction:yesButton];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (IBAction)SetNameAndNextView:(id)sender {
    NSString *name = self.nameTextField.text;
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *urlName = [name stringByAddingPercentEncodingWithAllowedCharacters:set];
    if (self.nameTextField.text!=nil &&![self.nameTextField.text isEqualToString:@""])
    {
        
    }
}
@end
