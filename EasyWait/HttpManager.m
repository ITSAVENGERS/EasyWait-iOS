//
//  HttpManager.m
//  AddNum
//
//  Created by ruchin somal on 09/05/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "HttpManager.h"


@implementation HttpManager{
}
// it is used for the single instance i.e.. in the lifecyle of app this class is initialize at one time
+ (id)sharedManager {
    static HttpManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

// get request method implementation

- (void)getRequestWithCallBack:(NSDictionary *)dict andUrl:(NSString *)url withCallback:(SuccessRequestBlock)callback
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //[manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager GET:url parameters:dict progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary *dict = responseObject;
        callback(YES,dict);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        callback(NO,nil);
        NSLog(@"Error: %@", error);
    }];
}

// post request method implementation

- (void)postRequestWithCallBack:(id)dict andUrl:(NSString *)url withCallback:(SuccessRequestBlock)callback
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager POST:url parameters:dict progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary *dict = responseObject;
        callback(YES,dict);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        callback(NO,nil);
        NSLog(@"%@",error);
    }];
}

// Internet Connectivity method implementation

-(void)InternetConnectivitywithCallback:(CheckInternetBlock)callback
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                // -- Reachable -- //
                callback(YES);
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                // -- Not reachable -- //
                callback(NO);
                break;
        }
    }];
}

// delete request method implementation

- (void)deleteRequestWithCallBack:(NSDictionary *)dict andUrl:(NSString *)url withCallback:(SuccessRequestBlock)callback
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager DELETE:url parameters:dict success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary *dict = responseObject;
        callback(YES,dict);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        callback(NO,nil);
        NSLog(@"Error: %@", error);
    }];
}

@end
