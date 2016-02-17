//
//  APIManager.h
//  EasyWait
//
//  Created by ruchin somal on 15/02/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessRequestBlock) (BOOL wasSuccessful, NSDictionary *dict);
typedef void (^SuccessRequestBlockVerify) (BOOL wasSuccessful, NSDictionary *dict);
@interface APIManager : NSObject
{
    NSString *url;
}
-(void)getRequest:(NSDictionary *)userData;
-(void)postRequest:(NSString *)userData AndBody:(NSDictionary *)body;
- (void)getRequestWithCallBack:(NSDictionary *)dict
                 withCallback:(SuccessRequestBlock)callback;
- (void)getRequestWithCallBackVerify:(NSDictionary *)dict
                        withCallback:(SuccessRequestBlockVerify)callback;
-(void)getRequestResetAndNext:(NSDictionary *)userData;
@end
