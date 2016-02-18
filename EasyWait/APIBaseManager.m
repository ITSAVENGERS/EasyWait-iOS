//
//  APIBaseManager.m
//  EasyWait
//
//  Created by ruchin somal on 16/02/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "APIBaseManager.h"

@implementation APIBaseManager
- (id)init {
    self = [super init];
    if (self) {
        Vendor_EndPoint = @"vendor";
        QStatus_EndPoint = @"qstatus";
        Register_EndPoint = @"register";
        Verify_EndPoint = @"verify";
        SetName_EndPoint = @"setname";
        PublicInfo_EndPoint = @"publicinfo";
        Get_EndPoint = @"get";
        Next_EndPoint = @"next";
        Reset_EndPoint = @"reset";
        apiManager = [[APIManager alloc]init];
        token = [[NSString alloc]init];
    }
    return self;
}

// Register your number

-(void)RegisterNumber:(NSString *)number
{
//    NSDictionary *dict = @{@"User" : Vendor_EndPoint,@"End_Point" : Register_EndPoint,@"Mobile_Number" : number};
//    [apiManager getRequest:dict];
    SuccessRequestBlock callback = ^(BOOL wasSuccessful, NSDictionary *dict) {
        if (wasSuccessful) {
            registerDict = dict;
            NSLog(@"%@",registerDict);
            if([self.Delegate respondsToSelector:@selector(startLoader)])
                [self.Delegate stopLoader];
        } else {
            NSLog(@"Error");
        }
    };
    NSDictionary *dict = @{@"User" : Vendor_EndPoint,@"End_Point" : Register_EndPoint,@"Mobile_Number" : number};
    [apiManager getRequestWithCallBack:dict
                   withCallback:callback];
}

// Verify your number

-(void)VerifyNumber:(NSString *)number AndOTP:(NSString *)otp
{
    SuccessRequestBlockVerify callback = ^(BOOL wasSuccessful, NSDictionary *dict) {
        if (wasSuccessful) {
            token = dict[@"token"];
            if([self.Delegate respondsToSelector:@selector(startLoader)])
                [self.Delegate startLoader];
            [[NSUserDefaults standardUserDefaults] setValue:token forKey:@"token"];
        } else {
            NSLog(@"Error");
        }
    };
    NSDictionary *dict = @{@"User" : Vendor_EndPoint, @"End_Point" : Verify_EndPoint, @"Mobile_Number" : number, @"otp" : otp,@"otp_start" : registerDict[@"otp_start"], @"service" : registerDict[@"service"], @"keymatch" : registerDict[@"keymatch"]};
    [apiManager getRequestWithCallBackVerify:dict
                          withCallback:callback];
}

// Set your name

-(void)RegisterNname:(NSString *)name
{
    NSDictionary *dict = @{@"User" : Vendor_EndPoint,@"End_Point" : SetName_EndPoint,@"token" : token,@"name" : name};
        [apiManager getRequest:dict];
}

// Turn to next

-(void)NextTurn:(NSString *)myToken
{
    NSDictionary *dict = @{@"User" : QStatus_EndPoint,@"End_Point" : Next_EndPoint,@"token" : myToken};
    [apiManager getRequestResetAndNext:dict];
}

// Reset your turn

-(void)ResetTurn:(NSString *)myToken
{
    NSDictionary *dict = @{@"User" : QStatus_EndPoint,@"End_Point" : Reset_EndPoint,@"token" : myToken};
    [apiManager getRequestResetAndNext:dict];
}

// Public Information

-(void)PublicInfo:(NSString *)number
{
    NSDictionary *dict = @{@"User" : QStatus_EndPoint,@"End_Point" : Reset_EndPoint,@"token" : number};
    [apiManager getRequestResetAndNext:dict];
}

// Get public info

-(void)GetPublicInfo:(NSString *)number
{
    NSDictionary *dict = @{@"User" : QStatus_EndPoint,@"End_Point" : Reset_EndPoint,@"token" : number};
    [apiManager getRequestResetAndNext:dict];
}
@end
