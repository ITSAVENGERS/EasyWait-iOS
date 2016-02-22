//
//  NextViewController.m
//  EasyWait
//
//  Created by ruchin somal on 08/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
{
    int counterValue;
}
- (IBAction)IncBTN:(id)sender;
- (IBAction)ResetBTN:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *counterDisplay;
@end

@implementation NextViewController
- (void)viewDidLoad {
    counterValue=0;
    baseManager = [[APIBaseManager alloc]init];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    myToken = [userDefault stringForKey:@"token"];
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)IncBTN:(id)sender {
    counterValue++;
    self.counterDisplay.text=[NSString stringWithFormat:@"%d", counterValue];
    [baseManager NextTurn:myToken];
    
}

- (IBAction)ResetBTN:(id)sender {
    counterValue=0;
    self.counterDisplay.text=[NSString stringWithFormat:@"%d", counterValue];
    [baseManager ResetTurn:myToken];
}


@end
