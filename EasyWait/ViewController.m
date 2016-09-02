//
//  ViewController.m
//  EasyWait
//
//  Created by ruchin somal on 07/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "UIView+Toast.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobiletxtfield;
@end

@implementation ViewController
@synthesize notification;
@synthesize myobject;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shareObject = [HttpManager sharedManager];
    self.myobject = [CommonObject sharedObject];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects: (id)[[UIColor colorWithRed:0/255.0 green:195/255.0 blue:147/255.0 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
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
}

-(void)stopLoader
{
    [self performSegueWithIdentifier:@"otpSegue" sender:@"otpSegue"];
}

- (IBAction)MobileBTN:(id)sender {
    NSString *mobileNumber = self.mobiletxtfield.text;
        if (mobileNumber ==nil && [mobileNumber isEqualToString:@""])
        {
            
        }
    else
    {
        
    }
    //[self performSegueWithIdentifier:@"otpSegue" sender:@"otpSegue"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    otpViewController *otpviewController=[segue destinationViewController];
        if ([segue.identifier isEqualToString:@"otpSegue"])
    {
        
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
