//
//  InfoViewController.m
//  EasyWait
//
//  Created by ruchin somal on 09/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
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
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects: (id)[[UIColor colorWithRed:0/255.0 green:195/255.0 blue:147/255.0 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
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
    infoNumber = self.mobiletxt.text;
    if (self.mobiletxt.text!=nil &&![self.mobiletxt.text isEqualToString:@""])
    {
        
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
    infoNumber = self.mobiletxt.text;
    if (self.mobiletxt.text!=nil &&![self.mobiletxt.text isEqualToString:@""])
    {
        
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


-(void)DataTransfer:(NSDictionary *)dict
{
    NSString *responseFound = [[dict objectForKey:@"found"]description];
    if ([responseFound isEqualToString:@"-1"]) {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Error"
                                      message:@"Invalid Number Or Number is not found!!!"
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
        [self.cell setText:@""];
        [self.found setText:@""];
        [self.username setText:@""];
    }
    else
    {
        [self.cell setText:[[dict objectForKey:@"cell"]description]];
        [self.found setText:[[dict objectForKey:@"found"]description]];
        [self.username setText:[[dict objectForKey:@"name"]description]];
    }
}

-(void)DataTransferQueue:(NSDictionary *)dict
{
    NSString *responseCounter = [[dict objectForKey:@"counter"]description];
    if ([responseCounter isEqualToString:@"-1"]) {
        [self.booking_open setText:@""];
        [self.counter setText:@""];
        [self.queue setText:@""];
        [self.stime setText:@""];
        [self.timenow setText:@""];
        [self.updatetime setText:@""];
    }
    else
    {
        NSString *startTime = [self convertTime:[[dict objectForKey:@"starttm"] description]];
        NSString *timeNow = [self convertTime:[[dict objectForKey:@"tmnow"] description]];
        NSString *updateTime = [self convertTime:[[dict objectForKey:@"updtm"] description]];
        [self.booking_open setText:[dict objectForKey:@"bookings_open"]];
        [self.counter setText:[[dict objectForKey:@"counter"] description]];
        [self.queue setText:[[dict objectForKey:@"qsize"] description]];
        [self.stime setText:startTime];
        //NSString *mytimenow = [dict objectForKey:@"tmnow"];
        [self.timenow setText:timeNow];
        //[self.timenow setText:@"8:40 AM"];
        [self.updatetime setText:updateTime];

    }
}
-(NSString *)convertTime:(NSString *)epochTime
{
    // Convert NSString to NSTimeInterval
    NSTimeInterval seconds = [epochTime doubleValue];
    
    NSDate *epochNSDate = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd \n HH:mm:ss"];
    NSString *time = [dateFormatter stringFromDate:epochNSDate];
    return time;
}
@end
