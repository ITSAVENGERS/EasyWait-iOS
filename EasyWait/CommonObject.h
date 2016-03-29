//
//  CommonObject.h
//  EasyWait
//
//  Created by ruchin somal on 16/03/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonObject : NSObject
@property (nonatomic, retain) NSString *someProperty;
+ (id)sharedObject;
@end
