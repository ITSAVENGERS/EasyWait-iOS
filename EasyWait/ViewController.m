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
    txtView.delegate =self;
    self.SubmitBTN.hidden=YES;
    self.VerifyBTN.hidden=YES;
    self.NameBTN.hidden=YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //NSLog(@"touchesBegan:withEvent:");
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
    
    mNumber=self.txtView.text;
   // NSLog(@"my name %@",mNumber);
    [self RegistrationAPICalling];
}
-(void)RegistrationAPICalling
{
    NSString *urlAsString = [NSString stringWithFormat:@"http://ewait.lkfans.org/api/vendor/register/91%@",mNumber];
    
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    //NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length] >0 && error == nil){
            //process the JSON response
            //use the main queue so that we can interact with the screen
            dispatch_async(dispatch_get_main_queue(), ^{
                [self parseResponse:data];
            });
        }
        else if ([data length] == 0 && error == nil){
            NSLog(@"Empty Response, not sure why?");
        }
        else if (error != nil){
            NSLog(@"Not again, what is the error = %@", error);
        }
    }];

}
- (void) parseResponse:(NSData *) data
{
    NSError *error = nil;
    
    //parsing the JSON response
    self.responseDict= [NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:&error];
    self.VerifyBTN.hidden=NO;
 // NSLog(@"%@",self.responseDict);
 // [[NSNotificationCenter defaultCenter]postNotificationName:@"gotData" object:nil];
    
}

- (IBAction)VerifyBTN:(id)sender {
    otpNum=self.veridyTxt.text;
    [self VerificationAPICalling];
}


-(void)VerificationAPICalling
{
    
    NSString *urlAsString = [NSString stringWithFormat:@"http://ewait.lkfans.org/api/vendor/verify/91%@/%@?service=cognalys&keymatch=%@&otp_start=%@",mNumber,otpNum,[self.responseDict valueForKey:@"keymatch"],[self.responseDict valueForKey:@"otp_start"]];
    
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    //NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length] >0 && error == nil){
            //process the JSON response
            //use the main queue so that we can interact with the screen
            dispatch_async(dispatch_get_main_queue(), ^{
                [self parseResponse1:data];
            });
        }
        else if ([data length] == 0 && error == nil){
            NSLog(@"Empty Response, not sure why?");
        }
        else if (error != nil){
            NSLog(@"Not again, what is the error = %@", error);
        }
    }];
    
}
- (void) parseResponse1:(NSData *) data
{
    NSError *error = nil;
    
    //parsing the JSON response
    self.verifyDict= [NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:&error];
    self.NameBTN.hidden=NO;
    // NSLog(@"%@",[self.verifyDict valueForKey:@"token"]);
    // [[NSNotificationCenter defaultCenter]postNotificationName:@"gotData" object:nil];
    
}
- (IBAction)NameBTN:(id)sender {
    name=self.nameTY.text;
    [self NameAPICalling];
}

-(void)NameAPICalling
{
    
    NSString *urlAsString = [NSString stringWithFormat:@"http://ewait.lkfans.org/api/vendor/setname/%@/%@",[self.verifyDict valueForKey:@"token"],name];
    NSString* encodedUrl = [urlAsString stringByAddingPercentEscapesUsingEncoding:
                            NSUTF8StringEncoding];
    
    NSURL *url = [[NSURL alloc] initWithString:encodedUrl];
    
    //NSLog(@"%@", encodedUrl);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length] >0 && error == nil){
            //process the JSON response
            //use the main queue so that we can interact with the screen
            dispatch_async(dispatch_get_main_queue(), ^{
                [self parseResponse2:data];
            });
        }
        else if ([data length] == 0 && error == nil){
            NSLog(@"Empty Response, not sure why?");
        }
        else if (error != nil){
            NSLog(@"Not again, what is the error = %@", error);
        }
    }];
    
}
- (void) parseResponse2:(NSData *) data
{
    NSError *error = nil;
    
    //parsing the JSON response
    self.nameDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:&error];
    //NSLog(@"%@",self.nameDict);
    // [[NSNotificationCenter defaultCenter]postNotificationName:@"gotData" object:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NextViewController *nxt=[segue destinationViewController];
        if ([segue.identifier isEqualToString:@"Next"])
    {
        nxt.myLog=[self.verifyDict valueForKey:@"token"];
        //NSLog(@"%@",nxt.myLog);
    }
    
}
@end
