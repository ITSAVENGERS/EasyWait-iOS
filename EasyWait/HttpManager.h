//
//  HttpManager.h
//  AddNum
//
//  Created by ruchin somal on 09/05/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>


typedef void (^SuccessRequestBlock) (BOOL wasSuccessful, NSDictionary *dict);
typedef void (^CheckInternetBlock) (BOOL wasSuccessful);
@interface HttpManager : NSObject
{
    
}
// methods declaration
+ (id)sharedManager;

- (void)getRequestWithCallBack:(NSDictionary *)dict andUrl:(NSString *)url withCallback:(SuccessRequestBlock)callback;

- (void)postRequestWithCallBack:(NSDictionary *)dict andUrl:(NSString *)url withCallback:(SuccessRequestBlock)callback;

-(void)InternetConnectivitywithCallback:(CheckInternetBlock)callback;

- (void)deleteRequestWithCallBack:(NSDictionary *)dict andUrl:(NSString *)url withCallback:(SuccessRequestBlock)callback;

@end
