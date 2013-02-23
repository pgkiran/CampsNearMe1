//
//  CampAppDelegate.m
//  CampsNearMe
//
//  Created by Kiran Patchigolla on 2/22/13.
//  Copyright (c) 2013 Kiran Patchigolla. All rights reserved.
//

#import "CampAppDelegate.h"

#import "CampTypeViewController.h"

#import "CampFavoritesViewController.h"

#import <Parse/Parse.h>
#import "UserLocationManager.h"
@implementation CampAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
#warning HIDE keys
        [UserLocationManager sharedInstance];
    UIViewController *viewController1 = [[CampTypeViewController alloc] initWithNibName:@"CampTypeViewController" bundle:nil];
    UIViewController *viewController2 = [[CampFavoritesViewController alloc] initWithNibName:@"CampFavoritesViewController" bundle:nil];
    UINavigationController *browseNavController = [[UINavigationController alloc] initWithRootViewController:viewController1];
       UINavigationController *favNavController = [[UINavigationController alloc] initWithRootViewController:viewController2];

    [browseNavController.navigationBar setBackgroundImage:[UIImage imageNamed: @"bg_navbar"]
                                         forBarMetrics:UIBarMetricsDefault];

    [favNavController.navigationBar setBackgroundImage:[UIImage imageNamed: @"bg_navbar"]
                   forBarMetrics:UIBarMetricsDefault];

    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[browseNavController, favNavController];
    self.window.rootViewController = self.tabBarController;
    UITabBar *tabBar = [self.tabBarController tabBar];
    tabBar.selectionIndicatorImage = [UIImage imageNamed:@"btn_tabbar_active"];
    //TODO clear the blue tint color for selected tabs
    if ([tabBar respondsToSelector:@selector(setBackgroundImage:)])
    {
        // set it just for this instance
        [tabBar setBackgroundImage:[UIImage imageNamed:@"bg_tabbar"]];
        
        // set for all
        // [[UITabBar appearance] setBackgroundImage: ...
    }
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
