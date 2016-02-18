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
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)SubBTN:(id)sender {
    [self InfoAPICalling];
}
-(void)InfoAPICalling
{
    
    NSString *urlAsString = [NSString stringWithFormat:@"http://ewait.lkfans.org/api/qstatus/publicinfo/91%@",self.mobiletxt.text];
    NSLog(@"%@", urlAsString);
    
}

- (IBAction)QueueBtn:(id)sender {
    [self QueueAPICalling];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

-(void)QueueAPICalling
{
        NSString *urlAsString = [NSString stringWithFormat:@"http://ewait.lkfans.org/api/qstatus/get/91%@",self.mobiletxt.text];
        NSLog(@"%@", urlAsString);
        
}
@end
