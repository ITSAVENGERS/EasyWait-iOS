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
    [self.nextLoader startAnimating];
    self.nextLoader.transform = CGAffineTransformMakeScale(2.0, 2.0);
    self.nextLoader.layer.cornerRadius = 5.0;
    counterValue++;
    self.counterDisplay.text=[NSString stringWithFormat:@"%d", counterValue];
    baseManager.Delegate = self;
    [baseManager NextTurn:myToken];
    
}

- (IBAction)ResetBTN:(id)sender {
    [self.nextLoader startAnimating];
    self.nextLoader.transform = CGAffineTransformMakeScale(2.0, 2.0);
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
