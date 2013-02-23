//
//  UserLocationManager.m
//  Mosurv
//
//  Created by Kiran on 3/10/12.
//  Copyright (c) 2012 __Appd__. All rights reserved.
//

#import "UserLocationManager.h"


NSString *kLocationUpdateManagerNotificationName = @"LocationUpdateManagerNotification";
NSString *kLocationUpdateManagerUserInfoKey = @"LocationUpdateManagerUserInfo";

static NSString *kUserLatitude  = @"userLatitudeKey";
static NSString *kUserLongitude = @"userLongitudeKey";

static UserLocationManager *singletonInstance = nil;

#define FEQUAL(a,b)     (fabs((a) - (b)) < FLT_EPSILON)
#define FEQUALZERO(a)   (fabs(a) < FLT_EPSILON)


@implementation UserLocationManager

@synthesize locManager, latestLocation,curUser;

+ (UserLocationManager *)sharedInstance
{
    /*@synchronized(self)*/ {
        if (singletonInstance == nil) {
            singletonInstance = [[UserLocationManager alloc] init];
        }
    }
    
    return singletonInstance;
}

- (id)init
{
    if ((self = [super init])) {
        NSLog(@"isMain : %d", [NSThread isMainThread]);
        CLLocationDegrees latitude=32.684254;
        CLLocationDegrees longitude=-117.177948; 
        self.latestLocation = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
        
        self.locManager = [[CLLocationManager alloc] init];
        [self.locManager setDelegate:self];
        // [self.locManager startUpdatingLocation];
        [self.locManager performSelectorOnMainThread:@selector(startUpdatingLocation) withObject:nil waitUntilDone:YES];
    }
    
    return self;
}

- (void) postLocationUpdateNotification
{
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:self.latestLocation, kLocationUpdateManagerUserInfoKey, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kLocationUpdateManagerNotificationName object:nil userInfo:userInfo];
}

#pragma mark - CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{
    if (!newLocation) {
        return;
    }
    
    CLLocationCoordinate2D oldCoordinate = self.latestLocation.coordinate;
    CLLocationCoordinate2D newCoordinate = newLocation.coordinate;

   if (!FEQUAL(oldCoordinate.latitude, newCoordinate.latitude) || !FEQUAL(oldCoordinate.longitude, newCoordinate.longitude)) {
        self.latestLocation = [[CLLocation alloc] initWithLatitude:newCoordinate.latitude longitude:newCoordinate.longitude];
        // self.latestLocation = [[CLLocation alloc] initWithLatitude:44.522300 longitude:-72.000000]; // for test
        NSLog(@"Location Updated : %f, %f", self.latestLocation.coordinate.latitude, self.latestLocation.coordinate.longitude);
        
        NSUserDefaults *userStore = [NSUserDefaults standardUserDefaults];
        [userStore setObject:[NSNumber numberWithDouble:newCoordinate.latitude] forKey:kUserLatitude];
        [userStore setObject:[NSNumber numberWithDouble:newCoordinate.longitude] forKey:kUserLongitude];
        [userStore synchronize];
        
        [self postLocationUpdateNotification];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error 
{
    NSLog(@"location fail : %@", error);
}

@end
