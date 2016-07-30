//
//  CommonObject.m
//  EasyWait
//
//  Created by ruchin somal on 16/03/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "CommonObject.h"

@implementation CommonObject
@synthesize someProperty;

#pragma mark Singleton Methods

+ (id)sharedObject {
    static CommonObject *sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

- (id)init {
    if (self = [super init]) {
        someProperty = @"Default Property Value";
    }
    return self;
}
@end
