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
    NSString *mystring;
    int counterValue;
}
- (IBAction)IncBTN:(id)sender;
- (IBAction)ResetBTN:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *counterDisplay;
@end

@implementation NextViewController

- (void)viewDidLoad {
    counterValue=0;
    //NSLog(@"%@",self.myLog);
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)IncBTN:(id)sender {
    counterValue++;
    self.counterDisplay.text=[NSString stringWithFormat:@"%d", counterValue];
    [self NextAPICalling];
    
}

-(void)NextAPICalling
{
    
    NSString *urlAsString = [NSString stringWithFormat:@"http://ewait.lkfans.org/api/qstatus/next/%@",self.myLog];
    
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
    self.nextDict= [NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:&error];
    //NSLog(@"%@",self.nextDict);
    // [[NSNotificationCenter defaultCenter]postNotificationName:@"gotData" object:nil];
    
}


- (IBAction)ResetBTN:(id)sender {
    counterValue=0;
    self.counterDisplay.text=[NSString stringWithFormat:@"%d", counterValue];
    [self ResetAPICalling];
}

-(void)ResetAPICalling
{
    
    NSString *urlAsString = [NSString stringWithFormat:@"http://ewait.lkfans.org/api/qstatus/reset/%@",self.myLog];
    
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
    self.resetDict= [NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:&error];
    //NSLog(@"%@",self.resetDict);
    // [[NSNotificationCenter defaultCenter]postNotificationName:@"gotData" object:nil];
    
}

@end
