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
    self.manager = [HttpManager sharedManager];
    self.myobject = [CommonObject sharedObject];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects: (id)[[UIColor colorWithRed:0/255.0 green:195/255.0 blue:147/255.0 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)SubBTN:(id)sender {
    infoNumber = self.mobiletxt.text;
    if (self.mobiletxt.text == nil && [self.mobiletxt.text isEqualToString:@""])
    {
        [self.myobject showAlert:@"Error" andTitle:@"Please Enter Valid Mobile Number" onView:self];
    }
    else
    {
        [MyLoader showLoadingView];
        NSString *url = [NSString stringWithFormat:@"%@%@%@",BASEURL,PUBLIC_INFO,infoNumber];
        [self.manager getRequestWithCallBack:nil andUrl:url withCallback:^(BOOL wasSuccessful, NSDictionary *dict) {
            [MyLoader hideLoadingView];
            if (wasSuccessful) {
                [self.cell setText:[[dict objectForKey:@"cell"]description]];
                [self.found setText:[[dict objectForKey:@"found"]description]];
                [self.username setText:[[dict objectForKey:@"name"]description]];
            } else {
                [self.view makeToast:@"Something went Wrong ,We are working on it !!!" duration:2.0 position:CSToastPositionCenter];
            }
        }];
    }
}

- (IBAction)QueueBtn:(id)sender {
    infoNumber = self.mobiletxt.text;
    if (self.mobiletxt.text == nil && [self.mobiletxt.text isEqualToString:@""])
    {
        [self.myobject showAlert:@"Error" andTitle:@"Please Enter Valid Mobile Number" onView:self];
    } else {
        [MyLoader showLoadingView];
        NSString *url = [NSString stringWithFormat:@"%@%@%@",BASEURL,GET_INFO,infoNumber];
        [self.manager getRequestWithCallBack:nil andUrl:url withCallback:^(BOOL wasSuccessful, NSDictionary *dict) {
            [MyLoader hideLoadingView];
            if (wasSuccessful) {
                
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
            } else {
                [self.view makeToast:@"Something went Wrong ,We are working on it !!!" duration:2.0 position:CSToastPositionCenter];
            }
        }];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
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
