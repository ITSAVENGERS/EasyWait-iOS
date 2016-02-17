//
//  ViewController.m
//  EasyWait
//
//  Created by ruchin somal on 07/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()
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

- (IBAction)MobileBTN:(id)sender {
    [self.activityIndicator startAnimating];
    mNumber = self.mobiletxtfield.text;
    NSLog(@"%@",mNumber);
    [self performSegueWithIdentifier:@"otpSegue" sender:sender];
    //[baseManager RegisterNumber:mNumber];
}

- (IBAction)VerifyBTN:(id)sender {
   // NSString *otpNum = self.veridyTxt.text;
    //[baseManager VerifyNumber:mNumber AndOTP:otpNum];
}

- (IBAction)NameBTN:(id)sender {
   // name=self.nameTY.text;
    [baseManager RegisterNname:name];
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NextViewController *nxt=[segue destinationViewController];
//        if ([segue.identifier isEqualToString:@"Next"])
//    {
//        nxt.myLog = baseManager.token;
//        //NSLog(@"%@",nxt.myLog);
//    }

//}
@end
