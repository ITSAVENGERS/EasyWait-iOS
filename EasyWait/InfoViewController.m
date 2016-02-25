//
//  InfoViewController.m
//  EasyWait
//
//  Created by ruchin somal on 09/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()<BaseProtocol>
@property (weak, nonatomic) IBOutlet UITextField *mobiletxt;
- (IBAction)SubBTN:(id)sender;
- (IBAction)QueueBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *infoLoader;
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    baseManager = [[APIBaseManager alloc]init];
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

- (IBAction)SubBTN:(id)sender {
    [self.infoLoader startAnimating];
    self.infoLoader.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.infoLoader.layer.cornerRadius = 5.0;
    infoNumber = self.mobiletxt.text;
    baseManager.BaseDelegate = self;
    [baseManager PublicInfo:infoNumber];
}

- (IBAction)QueueBtn:(id)sender {
    [self.infoLoader startAnimating];
    self.infoLoader.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.infoLoader.layer.cornerRadius = 5.0;
    infoNumber = self.mobiletxt.text;
    baseManager.BaseDelegate = self;
    [baseManager GetPublicInfo:infoNumber];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


-(void)DataTransfer:(NSDictionary *)dict
{
    [self.infoLoader stopAnimating];
    NSLog(@"%@",dict);
}
@end
