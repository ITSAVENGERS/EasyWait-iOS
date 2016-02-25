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
@property (weak, nonatomic) IBOutlet UILabel *booking_open;
@property (weak, nonatomic) IBOutlet UILabel *counter;
@property (weak, nonatomic) IBOutlet UILabel *queue;
@property (weak, nonatomic) IBOutlet UILabel *stime;
@property (weak, nonatomic) IBOutlet UILabel *timenow;
@property (weak, nonatomic) IBOutlet UILabel *updatetime;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *found;
@property (weak, nonatomic) IBOutlet UILabel *cell;
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
    [self.view bringSubviewToFront:self.infoLoader];
    self.infoLoader.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.infoLoader.layer.cornerRadius = 5.0;
    infoNumber = self.mobiletxt.text;
    baseManager.BaseDelegate = self;
    if (self.mobiletxt.text!=nil &&![self.mobiletxt.text isEqualToString:@""])
    {
        [self.infoLoader startAnimating];
        [baseManager PublicInfo:infoNumber];
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
}

- (IBAction)QueueBtn:(id)sender {
    [self.view bringSubviewToFront:self.infoLoader];
    self.infoLoader.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.infoLoader.layer.cornerRadius = 5.0;
    infoNumber = self.mobiletxt.text;
    baseManager.BaseDelegate = self;
    if (self.mobiletxt.text!=nil &&![self.mobiletxt.text isEqualToString:@""])
    {
        [self.infoLoader startAnimating];
        [baseManager GetPublicInfo:infoNumber];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


-(void)DataTransfer:(NSDictionary *)dict
{
    [self.infoLoader stopAnimating];
    [self.cell setText:[dict objectForKey:@"cell"]];
    [self.found setText:@"Yes"];
    [self.username setText:[dict objectForKey:@"name"]];
    //NSLog(@"%@",dict);
}

-(void)DataTransferQueue:(NSDictionary *)dict
{
    [self.infoLoader stopAnimating];
    [self.booking_open setText:[dict objectForKey:@"bookings_open"]];
        [self.counter setText:[dict objectForKey:@"counter"]];
        [self.queue setText:[dict objectForKey:@"qsize"]];
        [self.stime setText:[dict objectForKey:@"starttm"]];
    //NSString *mytimenow = [dict objectForKey:@"tmnow"];
        [self.timenow setText:@"8:40 AM"];
        [self.updatetime setText:[dict objectForKey:@"updtm"]];
    NSLog(@"%@",dict);
}
@end
