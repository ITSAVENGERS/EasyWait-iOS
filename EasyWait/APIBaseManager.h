//
//  APIBaseManager.h
//  EasyWait
//
//  Created by ruchin somal on 16/02/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIManager.h"

@protocol BaseManagerProtocol <NSObject>
-(void)startLoader;
-(void)stopLoader;
@end
@interface APIBaseManager : NSObject
{
    NSString *Vendor_EndPoint;
    NSString *QStatus_EndPoint;
    NSString *Register_EndPoint;
    NSString *Verify_EndPoint;
    NSString *SetName_EndPoint;
    NSString *PublicInfo_EndPoint;
    NSString *Get_EndPoint;
    NSString *Next_EndPoint;
    NSString *Reset_EndPoint;
    APIManager *apiManager;
    NSDictionary *registerDict;
    NSString *token;
}
//@property (strong, nonatomic)NSString *token;
@property(weak,nonatomic)id <BaseManagerProtocol>Delegate;
-(void)RegisterNumber:(NSString *)number;
-(void)VerifyNumber:(NSString *)number AndOTP:(NSString *)otp;
-(void)RegisterNname:(NSString *)name;
-(void)NextTurn:(NSString *)myToken;
-(void)ResetTurn:(NSString *)myToken;
-(void)PublicInfo:(NSString *)number;
-(void)GetPublicInfo:(NSString *)number;
@end
