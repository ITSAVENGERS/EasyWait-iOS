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
@property (weak, nonatomic) IBOutlet UITextField *txtView;
@property (weak, nonatomic) IBOutlet UIButton *SubmitBTN;
@property (weak, nonatomic) IBOutlet UITextField *veridyTxt;
@property (weak, nonatomic) IBOutlet UIButton *VerifyBTN;
- (IBAction)SubmitBTN:(id)sender;
- (IBAction)VerifyBTN:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTY;
@property (weak, nonatomic) IBOutlet UIButton *NameBTN;
- (IBAction)NameBTN:(id)sender;

@end

@implementation ViewController
@synthesize txtView;

- (void)viewDidLoad {
    [super viewDidLoad];
    baseManager = [[APIBaseManager alloc]init];
    txtView.delegate =self;
    //self.SubmitBTN.hidden=YES;
    //self.VerifyBTN.hidden=YES;
    //self.NameBTN.hidden=YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.SubmitBTN.hidden=NO;
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

- (IBAction)SubmitBTN:(id)sender {
    mNumber = self.txtView.text;
    [baseManager RegisterNumber:mNumber];
}

- (IBAction)VerifyBTN:(id)sender {
    NSString *otpNum = self.veridyTxt.text;
    [baseManager VerifyNumber:mNumber AndOTP:otpNum];
}

- (IBAction)NameBTN:(id)sender {
    name=self.nameTY.text;
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
