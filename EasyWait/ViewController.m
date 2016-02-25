//
//  ViewController.m
//  EasyWait
//
//  Created by ruchin somal on 07/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <BaseManagerProtocol>
@property (weak, nonatomic) IBOutlet UITextField *mobiletxtfield;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation ViewController
@synthesize notification;

- (void)viewDidLoad {
    [super viewDidLoad];
    baseManager = [[APIBaseManager alloc]init];
    baseManager.Delegate = self;
    [baseManager InternetChecking];
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
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)stopLoader
{
    [self performSegueWithIdentifier:@"otpSegue" sender:@"otpSegue"];
    [self.activityIndicator stopAnimating];
}

-(void)startLoader
{
    
}

- (IBAction)MobileBTN:(id)sender {
    self.activityIndicator.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.activityIndicator.layer.cornerRadius = 5.0;
    mNumber = self.mobiletxtfield.text;
    baseManager.Delegate = self;
        if (self.mobiletxtfield.text!=nil &&![self.mobiletxtfield.text isEqualToString:@""])
        {
            [self.activityIndicator startAnimating];
            [baseManager RegisterNumber:mNumber];
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
    //[self performSegueWithIdentifier:@"otpSegue" sender:@"otpSegue"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    otpViewController *otpviewController=[segue destinationViewController];
        if ([segue.identifier isEqualToString:@"otpSegue"])
    {
        otpviewController.myNumber = mNumber;
    }

}

-(void)InternetStatus:(NSString *)status
{
    // initialize CWNotification
    self.notification = [CWStatusBarNotification new];
    
    // set default blue color (since iOS 7.1, default window tintColor is black)
    self.notification.notificationLabelBackgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    [self setupNotification];
    [self.notification displayNotificationWithMessage:status forDuration:5.0];
}

- (void)setupNotification
{
    self.notification.notificationAnimationInStyle = 0;
    self.notification.notificationAnimationOutStyle = 0;
    self.notification.notificationWindow = CWNotificationStyleStatusBarNotification;
}
@end
