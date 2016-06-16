//
//  otpViewController.m
//  EasyWait
//
//  Created by ruchin somal on 18/02/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "otpViewController.h"

@interface otpViewController ()<BaseManagerProtocol>
@property (weak, nonatomic) IBOutlet UITextField *otpTextFIeld;
- (IBAction)VerifyBTN:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
- (IBAction)SetNameAndNextView:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *setName;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityLoader;

@end

@implementation otpViewController
@synthesize myNumber;
- (void)viewDidLoad {
    [super viewDidLoad];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects: (id)[[UIColor colorWithRed:0/255.0 green:195/255.0 blue:147/255.0 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    baseManager = [[APIBaseManager alloc]init];
    self.setName.hidden = YES;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(RecieveNotification) name:@"MyNotification" object:nil];
}
-(void)RecieveNotification
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Error"
                                  message:@"Please connect your internet"
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)startLoader
{
    [self.activityLoader startAnimating];
}

-(void)stopLoader
{
    [self.activityLoader stopAnimating];
    self.setName.hidden = NO;
}

-(void)checkToken
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Error"
                                  message:@"Please Enter the correct OTP"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Ok"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    [self resignFirstResponder];
                                    self.otpTextFIeld.text = @"";
                                }];
    
    [alert addAction:yesButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)VerifyBTN:(id)sender {
    self.activityLoader.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.activityLoader.layer.cornerRadius = 5.0;
     NSString *otpNum = self.otpTextFIeld.text;
    baseManager.Delegate = self;
    if (self.otpTextFIeld.text!=nil &&![self.otpTextFIeld.text isEqualToString:@""])
    {
        [self.activityLoader startAnimating];
        [baseManager VerifyNumber:myNumber AndOTP:otpNum];
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
        [baseManager RegisterNname:urlName];
    }
}
@end
