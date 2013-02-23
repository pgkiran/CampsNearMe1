//
//  UserLocationManager.h
//  Mosurv
//
//  Created by Kiran on 3/10/12.
//  Copyright (c) 2012 __Appd__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>
extern NSString *kLocationUpdateManagerNotificationName;
extern NSString *kLocationUpdateManagerUserInfoKey;

@interface UserLocationManager : NSObject <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locManager;
@property (strong, nonatomic) CLLocation *latestLocation;
@property (strong, nonatomic) PFUser *curUser;

+ (UserLocationManager *)sharedInstance;

@end
