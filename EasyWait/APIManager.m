//
//  APIManager.m
//  EasyWait
//
//  Created by ruchin somal on 15/02/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "APIManager.h"
#import <AFNetworking.h>
@implementation APIManager
- (id)init {
    self = [super init];
    if (self) {
        url = @"http://ewait.lkfans.org/api";
    }
    return self;
}
-(void)getRequest:(NSDictionary *)userData
{
    //NSString *getUrl= [url stringByAppendingString:userData];
    NSString *getUrl = [NSString stringWithFormat:@"%@/%@/%@/%@/%@",url,userData[@"User"],userData[@"End_Point"],userData[@"token"],userData[@"name"]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:getUrl parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(void)postRequest:(NSString *)userData AndBody:(NSDictionary *)body
{
    NSString *myUrl= [url stringByAppendingString:userData];
    NSLog(@"%@",myUrl);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:body progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


- (void)getRequestWithCallBack:(NSDictionary *)dict
                 withCallback:(SuccessRequestBlock)callback
{
    NSString *getUrl = [NSString stringWithFormat:@"%@/%@/%@/%@",url,dict[@"User"],dict[@"End_Point"],dict[@"Mobile_Number"]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:getUrl parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary *dict = responseObject;
        callback(YES,dict);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        callback(NO,nil);
        NSLog(@"Error: %@", error);
    }];
}


- (void)getRequestWithCallBackVerify:(NSDictionary *)dict
                  withCallback:(SuccessRequestBlockVerify)callback
{
    NSString *getUrl = [NSString stringWithFormat:@"%@/%@/%@/%@/%@?service=%@&keymatch=%@&otp_start=%@",url,dict[@"User"],dict[@"End_Point"],dict[@"Mobile_Number"],dict[@"otp"],dict[@"service"],dict[@"keymatch"],dict[@"otp_start"]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:getUrl parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary *dict = responseObject;
        callback(YES,dict);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        callback(NO,nil);
        NSLog(@"Error: %@", error);
    }];
}


-(void)getRequestResetAndNext:(NSDictionary *)userData withCallback:(SuccessRequestBlockResetAndNext)callback
{
    NSString *getUrl = [NSString stringWithFormat:@"%@/%@/%@/%@",url,userData[@"User"],userData[@"End_Point"],userData[@"token"]];
    NSLog(@"%@",getUrl);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:getUrl parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary *dict = responseObject;
        callback(YES,dict);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        callback(NO, nil);
        NSLog(@"Error: %@", error);
    }];
}
-(void)InternetConnectivity
{

}

-(void)InternetConnectivitywithCallback:(CheckInternetBlock)callback
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        //NSLog(@"Reachability changed: %@", AFStringFromNetworkReachabilityStatus(status));
        
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                // -- Reachable -- //
                callback(YES,@"Internet Connected");
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                // -- Not reachable -- //
                callback(YES,@"Error in connection internet");
                break;
        }
        
    }];
}
@end
