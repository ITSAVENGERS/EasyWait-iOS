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

- (void)viewDidLoad {
    [super viewDidLoad];
    baseManager = [[APIBaseManager alloc]init];
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
    [self.activityIndicator startAnimating];
    mNumber = self.mobiletxtfield.text;
    baseManager.Delegate = self;
    [baseManager RegisterNumber:mNumber];
    //[self performSegueWithIdentifier:@"otpSegue" sender:@"otpSegue"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    otpViewController *otpviewController=[segue destinationViewController];
        if ([segue.identifier isEqualToString:@"otpSegue"])
    {
        otpviewController.myNumber = mNumber;
    }

}
@end
