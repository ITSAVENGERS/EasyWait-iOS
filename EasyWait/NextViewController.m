//
//  NextViewController.m
//  EasyWait
//
//  Created by ruchin somal on 08/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()<BaseManagerProtocol>
{
    int counterValue;
}
- (IBAction)IncBTN:(id)sender;
- (IBAction)ResetBTN:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *nextLoader;
@property (weak, nonatomic) IBOutlet UILabel *counterDisplay;
@end

@implementation NextViewController
- (void)viewDidLoad {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects: (id)[[UIColor colorWithRed:0/255.0 green:195/255.0 blue:147/255.0 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    counterValue=0;
    baseManager = [[APIBaseManager alloc]init];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    myToken = [userDefault stringForKey:@"token"];
    [super viewDidLoad];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)IncBTN:(id)sender {
    [self.nextLoader startAnimating];
    self.nextLoader.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.nextLoader.layer.cornerRadius = 5.0;
    counterValue++;
    self.counterDisplay.text=[NSString stringWithFormat:@"%d", counterValue];
    baseManager.Delegate = self;
    [baseManager NextTurn:myToken];
    
}

- (IBAction)ResetBTN:(id)sender {
    [self.nextLoader startAnimating];
    self.nextLoader.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.nextLoader.layer.cornerRadius = 5.0;
    counterValue=0;
    self.counterDisplay.text=[NSString stringWithFormat:@"%d", counterValue];
    baseManager.Delegate = self;
    [baseManager ResetTurn:myToken];
}

-(void)startLoader
{
    
}

-(void)stopLoader
{
    [self.nextLoader stopAnimating];
}
@end
