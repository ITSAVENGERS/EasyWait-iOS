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

- (IBAction)VerifyBTN:(id)sender {
    [self.activityLoader startAnimating];
    self.activityLoader.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.activityLoader.layer.cornerRadius = 5.0;
     NSString *otpNum = self.otpTextFIeld.text;
    baseManager.Delegate = self;
    [baseManager VerifyNumber:myNumber AndOTP:otpNum];
}
- (IBAction)SetNameAndNextView:(id)sender {
    NSString *name = self.nameTextField.text;
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *urlName = [name stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSLog(@"%@",urlName);
    [baseManager RegisterNname:urlName];
}
@end
