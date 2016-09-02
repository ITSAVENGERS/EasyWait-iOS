//
//  otpViewController.m
//  EasyWait
//
//  Created by ruchin somal on 18/02/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "otpViewController.h"
#import "NextViewController.h"

@interface otpViewController ()
{
    NSString *token;
}
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
    token = [[NSString alloc]init];
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
    if (self.otpTextFIeld.text == nil && [self.otpTextFIeld.text isEqualToString:@""])
    {
        [self.myobject showAlert:@"Error" andTitle:@"Please Enter Valid OTP" onView:self];
    }
    else
    {
        [MyLoader showLoadingView];
        NSDictionary *dict = @{@"service":_service, @"otp_start":_otp_start,@"keymatch":_keymatch};
        NSString *url = [NSString stringWithFormat:@"%@%@%@/%@",BASEURL,OTP_VERIFY,mobileNumber,otp];
        [self.manager getRequestWithCallBack:dict andUrl:url withCallback:^(BOOL wasSuccessful, NSDictionary *dict) {
            [MyLoader hideLoadingView];
            if (wasSuccessful) {
                token = [dict[@"token"] description];
            } else {
                [self.view makeToast:@"Something went Wrong ,We are working on it !!!" duration:2.0 position:CSToastPositionCenter];
            }
        }];
    }
}

- (IBAction)SetNameAndNextView:(id)sender {
    NSString *name = self.nameTextField.text;
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *urlName = [name stringByAddingPercentEncodingWithAllowedCharacters:set];
    if (self.nameTextField.text == nil && [self.nameTextField.text isEqualToString:@""])
    {
        [self.myobject showAlert:@"Error" andTitle:@"Please Enter your name" onView:self];
    } else {
        [MyLoader showLoadingView];
        NSString *url = [NSString stringWithFormat:@"%@%@%@/%@",BASEURL,SET_NAME,token,urlName];
        [self.manager getRequestWithCallBack:nil andUrl:url withCallback:^(BOOL wasSuccessful, NSDictionary *dict) {
            [MyLoader hideLoadingView];
            if (wasSuccessful) {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                NextViewController *next = [storyboard instantiateViewControllerWithIdentifier:@"next"];
                next.myToken = token;
                [self.navigationController pushViewController:next animated:YES];
            } else {
                [self.view makeToast:@"Something went Wrong ,We are working on it !!!" duration:2.0 position:CSToastPositionCenter];
            }
        }];
    }
}
@end
