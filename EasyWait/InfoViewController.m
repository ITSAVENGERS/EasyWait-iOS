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
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *qLabel;
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SubBTN:(id)sender {
    [self InfoAPICalling];
}
-(void)InfoAPICalling
{
    
    NSString *urlAsString = [NSString stringWithFormat:@"http://ewait.lkfans.org/api/qstatus/publicinfo/91%@",self.mobiletxt.text];
    
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
    self.infoDict= [NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:&error];
    //NSLog(@"%@",self.infoDict);
    NSString *response=[[NSString alloc]initWithFormat:@"mobile no= %@\n Name =%@",[self.infoDict valueForKey:@"cell"],[self.infoDict valueForKey:@"name"]];
    self.infoLabel.text=response;
    // [[NSNotificationCenter defaultCenter]postNotificationName:@"gotData" object:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)QueueBtn:(id)sender {
    [self QueueAPICalling];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

-(void)QueueAPICalling
{
        NSString *urlAsString = [NSString stringWithFormat:@"http://ewait.lkfans.org/api/qstatus/get/91%@",self.mobiletxt.text];
        
        NSURL *url = [[NSURL alloc] initWithString:urlAsString];
        //NSLog(@"%@", urlAsString);
        
        [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            
            if ([data length] >0 && error == nil){
                //process the JSON response
                //use the main queue so that we can interact with the screen
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self parseResponse2:data];
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
- (void) parseResponse2:(NSData *) data
    {
        NSError *error = nil;
        
        //parsing the JSON response
        self.queueDict= [NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:&error];
        //NSLog(@"%@",self.queueDict);
        NSString *response1=[[NSString alloc]initWithFormat:@"%@",self.queueDict];
        self.qLabel.text=response1;
        // [[NSNotificationCenter defaultCenter]postNotificationName:@"gotData" object:nil];
        
    }
@end
