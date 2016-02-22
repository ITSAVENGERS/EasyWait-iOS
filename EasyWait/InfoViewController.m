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
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    baseManager = [[APIBaseManager alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)SubBTN:(id)sender {
    infoNumber = self.mobiletxt.text;
    [baseManager PublicInfo:infoNumber];
}

- (IBAction)QueueBtn:(id)sender {
    infoNumber = self.mobiletxt.text;
    [baseManager GetPublicInfo:infoNumber];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

-(void)DataTransfer:(NSDictionary *)dict
{
    NSLog(@"%@",dict);
}
@end
